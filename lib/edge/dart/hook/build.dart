import 'dart:io';

import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

/// Native Assets build hook (monorepo / development).
///
/// Builds the `qdrant-edge-ffi` cdylib from the workspace and registers it under
/// the asset id the generated binding expects
/// (`package:qdrant_edge/uniffi:qdrant_edge_ffi`). `dart test` / `dart run` /
/// `flutter test` invoke it automatically (no experiment flag on Dart 3.12+).
///
/// This dev hook builds ONLY the host target from source (needs the nightly Rust
/// toolchain + protobuf on PATH). It cannot cross-compile for a device/emulator
/// and fails fast if asked to — a pub.dev release swaps it for a
/// prebuilt-download hook (see README "Distribution").
void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;

    final targetOS = input.config.code.targetOS;
    if (targetOS != OS.current) {
      // The from-source dev hook builds the host triple only (no `--target`).
      // Registering a host binary as a foreign-target asset would silently ship
      // the wrong platform's library; fail loudly instead.
      throw UnsupportedError(
        'qdrant_edge dev build hook can only build for the host OS '
        '(${OS.current}), but was asked to build for $targetOS. Cross-target '
        'builds need the prebuilt-download release hook (see README '
        '"Distribution").',
      );
    }

    // lib/edge/dart/ -> the Cargo workspace root is three levels up.
    final workspaceRoot = input.packageRoot.resolve('../../../');

    // Explicit `+nightly` (the rust-toolchain.toml override does NOT apply when
    // cargo runs from the workspace root — rustup only walks up from the CWD)
    // and `--no-default-features` (drop the `matrix`/`search_matrix` op to match
    // the mobile Swift/Kotlin surfaces).
    final cargoBin = '${Platform.environment['HOME'] ?? ''}/.cargo/bin';
    final result = await Process.run(
      'cargo',
      ['+nightly', 'build', '--locked', '--no-default-features', '-p', 'qdrant-edge-ffi'],
      workingDirectory: workspaceRoot.toFilePath(),
      environment: {
        ...Platform.environment,
        // Append (not prepend) so system tools win over ~/.cargo/bin.
        'PATH': '${Platform.environment['PATH']}:$cargoBin',
      },
    );
    if (result.exitCode != 0) {
      throw Exception(
        'cargo build -p qdrant-edge-ffi failed (exit ${result.exitCode}):\n'
        '${result.stderr}',
      );
    }

    final libFileName = switch (targetOS) {
      OS.macOS || OS.iOS => 'libqdrant_edge_ffi.dylib',
      OS.windows => 'qdrant_edge_ffi.dll',
      _ => 'libqdrant_edge_ffi.so',
    };
    final dylib = workspaceRoot.resolve('target/debug/$libFileName');
    if (!File.fromUri(dylib).existsSync()) {
      throw Exception('expected cdylib not produced: ${dylib.toFilePath()}');
    }

    output.assets.code.add(
      CodeAsset(
        package: 'qdrant_edge',
        name: 'uniffi:qdrant_edge_ffi',
        linkMode: DynamicLoadingBundled(),
        file: dylib,
      ),
    );

    // Re-run the hook when ANY build input changes — not just the thin FFI
    // wrapper crate. `qdrant-edge-ffi` compiles in the `edge`/`segment`/`shard`/
    // `sparse` crates, so editing those (or the lockfile) must invalidate the
    // cached dylib; otherwise `dart test` silently passes against a stale build.
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
