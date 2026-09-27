# Changelog

## 0.8.0-dev.4

**Upgrade if you use 0.8.0-dev.1, 0.8.0-dev.2 or 0.8.0-dev.3.** Those versions
leak native memory on almost every call: the process grows with use and the
memory comes back only when it exits. Stored data is not affected. To fix it,
change the dependency to `qdrant_edge: 0.8.0-dev.4`; no code changes are needed.
The public API and the native libraries (`edge-dart-native-v0.8.0`) are the
same as in 0.8.0-dev.3.

What leaked:

- **Results and typed errors.** Every call that returns a record, list or
  string (`search`, `query`, `queryBatch`, `queryGroups`, `retrieve`,
  `scroll`, `facet`, `info`, `config`, `path`, `snapshotManifest`,
  `probeShard`), and every `EdgeException`, left its serialized result in
  Rust-owned memory that the Dart GC cannot see. The leak grows with the size
  of the result.
- **Arguments.** Every call taking a record, list, string or optional argument
  (requests, points, filters, configs) left the native copy made while
  converting it.
- **Nested enums.** Queries using `SampleScoringQuery`, and text indexes with a
  `stemmer` or `stopwords` setting (when created or read back, for example
  through `info()`), also allocated a small Rust buffer per conversion that was
  never freed.

Measured on macOS arm64, process RSS after 20,000 searches (limit 10, returning
128-dim vectors and 211-byte JSON payloads, 2,000 points, after 2,000
warm-up searches), two runs each:
0.8.0-dev.3 grew by 590,217,216 and 590,299,136 bytes (29,511 and 29,515 bytes
per search); 0.8.0-dev.4 grew by 163,840 and 409,600 bytes.

The fixes come from the uniffi-dart generator (Uniffi-Dart/uniffi-dart#179,
#180 and #182, still open upstream), applied to the generator fork this package
uses; the binding is regenerated with them.

Known issue, not fixed here (present since 0.8.0-dev.1): if converting an
argument throws in Dart, for example `search` with a negative `limit`, the
shard reference taken for that call is never released, so the shard keeps its
file lock after `dispose()` and reopening it throws `ShardLockedEdgeException`
until the process exits. `unload()` still releases the lock.

## 0.8.0-dev.3

Consumer-driven DX fixes for opening, distinguishing, and clearing shards. All
additive — no change to existing `load`/`search`/`update`/filter semantics.

- **`probeShard(path:)`** — classify a directory as `none` / `loadable` /
  `unreadable` (with a reason) *before* opening it, without taking the WAL lock.
  It answers "is there a store here, and would it open?" so consumers no longer
  reverse-engineer the on-disk layout. In particular, a shard whose
  `edge_config.json` is missing but whose segments are intact now reports
  `loadable` (it reopens fine) — removing the "full corpus seen as empty" class
  of bugs.
- **`ShardLockedEdgeException`** — opening a shard another handle already holds
  now throws this distinct, recoverable exception instead of a generic
  `OperationExceptionEdgeException`, so callers can retry or report "already
  open" without substring-matching a message.
- **`EdgeShard.clear()`** — deletes every point in place (the shard stays open,
  its config and indexes intact); the discoverable form of the match-all
  `deletePointsByFilter(Filter())` idiom.
- **Exception guarantee**: `UniffiInternalError` is now exported, so every
  exception crossing the API is catchable by name — an `EdgeException`
  (domain/engine error) or `UniffiInternalError` (a Rust panic or bindings/native
  protocol mismatch). Documented under README "Error handling". The
  previously-unexported top-level `unpackSnapshot` is exported too.
- Re-cut of the `edge-dart-native-v0.8.0` prebuilts to carry the new FFI symbols
  (checksums updated).

## 0.8.0-dev.2

- Fix: normalize the iOS native binary's minimum OS version to 13.0 to avoid
  App Store rejection (ITMS-90208). Flutter's Native Assets wrapper hardcodes
  `MinimumOSVersion 13.0` into the generated `.framework` Info.plist, and App
  Store Connect rejects a nested framework whose binary minos (15.0) exceeds
  its own plist. The prebuilt iOS dylibs now carry minos 13.0.

## 0.8.0

First release of the Qdrant Edge SDK for Dart & Flutter — on-device vector
search with no server and no network, powered by the shared `qdrant-edge-ffi`
Rust crate (the same crate the Swift and Kotlin SDKs bind) through UniFFI.

- **Full shard API**: load/persist, upsert, search, and query (nearest,
  RRF/DBSF fusion, MMR, formula, order-by, sample), retrieve / scroll / count /
  facet / groups, the filter-condition set, config setters, and snapshot
  manifest.
- **Curated public surface** via `package:qdrant_edge/qdrant_edge.dart` — the
  UniFFI plumbing stays out of the semver contract behind an explicit `show`
  list.
- **Native engine as a Native Asset**: the build hook resolves a per-platform,
  SHA256-pinned prebuilt cdylib (Linux x86_64/arm64, Windows x86_64, macOS
  arm64, iOS arm64 device/simulator, Android arm64/x86_64), downloading it from
  the release when no local build is available — so consumers need no Rust
  toolchain.
- Built `--no-default-features` (no `search_matrix`), matching the Swift and
  Kotlin mobile SDKs.
