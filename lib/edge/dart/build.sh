#!/usr/bin/env bash
# Regenerate lib/src/qdrant_edge_ffi.dart from the `qdrant-edge-ffi` crate.
#
# The binding is generated in *library mode*: uniffi-bindgen-dart reads the
# UniFFI metadata embedded in a compiled cdylib (our crate uses
# `setup_scaffolding!()`, i.e. proc-macros and no UDL). `uniffi.toml` sets the
# Dart package name so the generated `@Native` asset ids match this package.
#
# Requires the `uniffi_bindgen_dart` CLI on PATH (or set UNIFFI_BINDGEN_DART),
# the nightly Rust toolchain, and protobuf.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WORKSPACE_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
export PATH="$HOME/.cargo/bin:$PATH"

echo "==> Building qdrant-edge-ffi cdylib (host)…"
( cd "$WORKSPACE_ROOT" && cargo build -p qdrant-edge-ffi )

DYLIB="$WORKSPACE_ROOT/target/debug/libqdrant_edge_ffi.dylib"
[ -f "$DYLIB" ] || DYLIB="$WORKSPACE_ROOT/target/debug/libqdrant_edge_ffi.so"
[ -f "$DYLIB" ] || { echo "error: built cdylib not found under target/debug" >&2; exit 1; }

BINDGEN="${UNIFFI_BINDGEN_DART:-uniffi_bindgen_dart}"
echo "==> Generating Dart binding into lib/src/…"
"$BINDGEN" \
  --library "$DYLIB" \
  --out-dir "$SCRIPT_DIR/lib/src" \
  --config "$SCRIPT_DIR/uniffi.toml"

echo "==> Wrote $SCRIPT_DIR/lib/src/qdrant_edge_ffi.dart"
