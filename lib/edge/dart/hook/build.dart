import 'dart:io';

import 'package:code_assets/code_assets.dart';
import 'package:hooks/hooks.dart';

/// Native Assets build hook.
///
/// Builds the `qdrant-edge-ffi` cdylib from the workspace and registers it under
/// the asset id the generated binding expects
/// (`package:qdrant_edge/uniffi:qdrant_edge_ffi`). `dart test` / `dart run` /
/// `flutter test` invoke this automatically.
///
/// This is the monorepo/development hook: it builds from source, so it needs the
/// nightly Rust toolchain and protobuf on PATH (see the workspace README). A
/// pub.dev release swaps this for a prebuilt-download hook (see README
/// "Distribution").
void main(List<String> args) async {
  await build(args, (input, output) async {
    if (!input.config.buildCodeAssets) return;

    // lib/edge/dart/ -> the Cargo workspace root is three levels up.
    final workspaceRoot = input.packageRoot.resolve('../../../');

    final cargoBin = '${Platform.environment['HOME']}/.cargo/bin';
    final result = await Process.run(
      'cargo',
      ['build', '-p', 'qdrant-edge-ffi'],
      workingDirectory: workspaceRoot.toFilePath(),
      environment: {
        ...Platform.environment,
        'PATH': '$cargoBin:${Platform.environment['PATH']}',
      },
    );
    if (result.exitCode != 0) {
      throw Exception(
        'cargo build -p qdrant-edge-ffi failed (exit ${result.exitCode}):\n'
        '${result.stderr}',
      );
    }

    final os = input.config.code.targetOS;
    final libFileName = switch (os) {
      OS.macOS || OS.iOS => 'libqdrant_edge_ffi.dylib',
      OS.windows => 'qdrant_edge_ffi.dll',
      _ => 'libqdrant_edge_ffi.so',
    };
    final dylib = workspaceRoot.resolve('target/debug/$libFileName');

    output.assets.code.add(
      CodeAsset(
        package: 'qdrant_edge',
        name: 'uniffi:qdrant_edge_ffi',
        linkMode: DynamicLoadingBundled(),
        file: dylib,
      ),
    );
    // Rebuild when the FFI crate's source changes (not the built dylib itself —
    // that's this hook's output, and `cargo build` rewrites it every run, which
    // would otherwise force an endless "file modified during build" rerun).
    output.dependencies.add(workspaceRoot.resolve('lib/edge/ffi/src/'));
  });
}
