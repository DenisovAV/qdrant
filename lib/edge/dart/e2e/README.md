# qdrant_edge_e2e

On-device operation-coverage harness for the Qdrant Edge Dart SDK
(`qdrant_edge`, a path dependency on `../`). It runs the **full operation suite**
against the native engine on Android, iOS, macOS, Linux, and Windows via the
Flutter `integration_test` framework — the same 33 scenarios as
`../test/operations_test.dart`, but executed on a real device runtime.

## Run

```sh
flutter test integration_test/operations_test.dart -d <device-id>
```

On desktop OSes the SDK's Native Assets hook builds the engine from source; on
iOS/Android it uses the prebuilt native library (`.so` / `.dylib`) provisioned by
the hook. In `.github/workflows/edge-dart-device.yml` the **iOS Simulator** and
**Android emulator** jobs run this Flutter harness; the **desktop**
(macOS/Windows/Linux) jobs run the same scenarios headlessly via `dart test`
from `lib/edge/dart` — no Flutter app needed there.

`integration_test/operations_test.dart` mirrors `../test/operations_test.dart`
(the plain `dart test` version) — keep both in sync when SDK behaviour changes.
