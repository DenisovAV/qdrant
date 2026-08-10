import 'dart:io';

import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

/// Native Assets build hook for the Qdrant Edge SDK.
///
/// Registers the `qdrant-edge-ffi` cdylib under the asset id the generated
/// binding expects (`package:qdrant_edge/uniffi:qdrant_edge_ffi`). `dart test` /
/// `dart run` / `flutter test` / `flutter run` invoke it automatically.
///
/// Two provisioning modes, in priority order:
///
///  1. **Prebuilt** — if a per-platform cdylib exists under
///     `$QDRANT_EDGE_PREBUILT_DIR/<platform>/` or `native/prebuilt/<platform>/`,
///     register it. This is how device/emulator + CI targets are served (the
///     host cannot cross-compile the engine from source), and the shape a
///     pub.dev release uses (a download step drops the archive here first).
///  2. **From source (host only)** — otherwise, if the target is the host OS,
///     build the cdylib from the Cargo workspace (needs nightly Rust + protobuf
///     on PATH). This is the monorepo/dev convenience path.
///
/// A cross-target with no prebuilt fails loudly rather than shipping a
/// host binary under a foreign-target asset.
void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;

    final code = input.config.code;
    final targetOS = code.targetOS;
    final arch = code.targetArchitecture;
    final iosSdk = targetOS == OS.iOS ? code.iOS.targetSdk : null;

    final libFileName = switch (targetOS) {
      OS.macOS || OS.iOS => 'libqdrant_edge_ffi.dylib',
      OS.windows => 'qdrant_edge_ffi.dll',
      _ => 'libqdrant_edge_ffi.so',
    };

    // Apple builds take a directoryTreeSignature over each input dir; if the
    // registered CodeAsset.file lives inside one (the prebuilt dir, which we
    // also list as a dependency), Xcode's "Flutter Assemble" depends on its own
    // output → "Cycle inside Flutter Assemble". Copy into the hook's
    // outputDirectory (an allowed root, never an input) and register from there.
    Uri stage(Uri src) {
      if (targetOS != OS.macOS && targetOS != OS.iOS) return src;
      final dest = input.outputDirectory.resolve(src.pathSegments.last);
      final s = File.fromUri(src);
      final d = File.fromUri(dest);
      // Re-stage when the dest is missing, a different size, OR older than the
      // source: a rebuilt cdylib is frequently the SAME size, so a size-only
      // check would keep a stale staged copy.
      if (!d.existsSync() ||
          d.lengthSync() != s.lengthSync() ||
          d.statSync().modified.isBefore(s.statSync().modified)) {
        d.parent.createSync(recursive: true);
        s.copySync(dest.toFilePath());
      }
      return dest;
    }

    void register(Uri file) {
      output.assets.code.add(
        CodeAsset(
          package: 'qdrant_edge',
          name: 'uniffi:qdrant_edge_ffi',
          linkMode: DynamicLoadingBundled(),
          file: file,
        ),
      );
    }

    // ---- 1. Prebuilt -------------------------------------------------------
    final dirName = _prebuiltDirName(targetOS, arch, iosSdk);
    if (dirName != null) {
      final override = Platform.environment['QDRANT_EDGE_PREBUILT_DIR'];
      final searchDirs = <Uri>[
        if (override != null && override.isNotEmpty)
          Directory(override).absolute.uri.resolve('$dirName/'),
        input.packageRoot.resolve('native/prebuilt/$dirName/'),
      ];
      for (final dir in searchDirs) {
        final lib = dir.resolve(libFileName);
        if (File.fromUri(lib).existsSync()) {
          register(stage(lib));
          output.dependencies.add(dir);
          return;
        }
      }
    }

    // ---- 2. From source (host only) ---------------------------------------
    if (targetOS != OS.current) {
      throw UnsupportedError(
        'qdrant_edge: no prebuilt cdylib for $targetOS/$arch'
        '${iosSdk == null ? '' : '/$iosSdk'} under '
        'native/prebuilt/$dirName (or \$QDRANT_EDGE_PREBUILT_DIR), and the host '
        'cannot cross-compile the engine from source. Provide a prebuilt for '
        'this target (see README "Distribution").',
      );
    }

    // lib/edge/dart/ -> the Cargo workspace root is three levels up.
    final workspaceRoot = input.packageRoot.resolve('../../../');
    // `+nightly` is a rustup directive that ONLY rustup's cargo shim understands.
    // Under an Xcode/Gradle build environment a Homebrew `cargo` is often first
    // on PATH and fails with "no such command: +nightly", so invoke the rustup
    // cargo by absolute path and PREPEND ~/.cargo/bin (the rustup shim must win).
    // Path-separator, home var, and exe suffix are all platform-specific (this
    // hook builds from source on Windows/Linux/macOS hosts alike).
    final sep = Platform.pathSeparator;
    final home = Platform.environment['HOME'] ??
        Platform.environment['USERPROFILE'] ??
        '';
    final cargoBin = home.isEmpty ? '' : '$home$sep.cargo${sep}bin';
    final cargoExe = Platform.isWindows ? 'cargo.exe' : 'cargo';
    final rustupCargo =
        cargoBin.isNotEmpty && File('$cargoBin$sep$cargoExe').existsSync()
            ? '$cargoBin$sep$cargoExe'
            : 'cargo';
    final pathListSep = Platform.isWindows ? ';' : ':';
    final envPath = Platform.environment['PATH'] ?? '';
    final result = await Process.run(
      rustupCargo,
      ['+nightly', 'build', '--locked', '--no-default-features', '-p', 'qdrant-edge-ffi'],
      workingDirectory: workspaceRoot.toFilePath(),
      environment: {
        ...Platform.environment,
        'PATH': cargoBin.isEmpty ? envPath : '$cargoBin$pathListSep$envPath',
      },
    );
    if (result.exitCode != 0) {
      throw Exception(
        'cargo build -p qdrant-edge-ffi failed (exit ${result.exitCode}):\n'
        '${result.stderr}',
      );
    }

    final dylib = workspaceRoot.resolve('target/debug/$libFileName');
    if (!File.fromUri(dylib).existsSync()) {
      throw Exception('expected cdylib not produced: ${dylib.toFilePath()}');
    }
    register(dylib);

    // Re-run when ANY build input changes — `qdrant-edge-ffi` compiles in the
    // edge/segment/shard/sparse crates, so editing those (or the lockfile) must
    // invalidate the cached dylib or `dart test` silently passes against stale.
    for (final rel in const [
      'lib/edge/ffi/src/',
      'lib/edge/ffi/Cargo.toml',
      'lib/edge/src/',
      'lib/segment/src/',
      'lib/shard/src/',
      'lib/sparse/src/',
      'Cargo.lock',
    ]) {
      output.dependencies.add(workspaceRoot.resolve(rel));
    }
  });
}

/// `<os>_<arch>` prebuilt subdir; iOS distinguishes device vs simulator.
/// Returns null for an unsupported OS/arch (caller falls through).
String? _prebuiltDirName(OS os, Architecture arch, IOSSdk? iosSdk) {
  final archName = switch (arch) {
    Architecture.arm64 => 'arm64',
    Architecture.x64 => 'x86_64',
    _ => null,
  };
  if (archName == null) return null;
  return switch (os) {
    OS.iOS =>
      iosSdk == IOSSdk.iPhoneSimulator ? 'ios_sim_$archName' : 'ios_$archName',
    OS.macOS => 'macos_$archName',
    OS.android => 'android_$archName',
    OS.linux => 'linux_$archName',
    OS.windows => 'windows_$archName',
    _ => null,
  };
}
