import 'dart:io';

import 'package:qdrant_edge/qdrant_edge.dart';
import 'package:test/test.dart';

void main() {
  test('load -> upsert -> search round-trips through the native engine', () {
    final dir = Directory.systemTemp.createTempSync('qdrant_edge_test_');
    addTearDown(() => dir.deleteSync(recursive: true));

    // A single unnamed 4-dim dot-product vector field — mirrors the Swift/Kotlin
    // SDK tests so behaviour can be compared across bindings.
    final config = EdgeConfig(
      vectorData: {'': VectorDataConfig(size: 4, distance: Distance.dot)},
    );
    final shard = EdgeShard.load(path: dir.path, config: config);

    shard.update(
      operation: UpdateOperation.upsertPoints(points: [
        Point(
          id: NumIdPointId(1),
          vector: SingleVector([1.0, 0.0, 0.0, 0.0]),
          payload: '{"label":"a"}',
        ),
        Point(
          id: NumIdPointId(2),
          vector: SingleVector([0.0, 1.0, 0.0, 0.0]),
          payload: '{"label":"b"}',
        ),
        Point(
          id: NumIdPointId(3),
          vector: SingleVector([0.0, 0.0, 1.0, 0.0]),
          payload: '{"label":"c"}',
        ),
      ]),
    );

    final results = shard.search(
      request: SearchRequest(
        query: NearestQuery(
          vector: DenseNamedVector([1.0, 0.0, 0.0, 0.0]),
          using: null,
        ),
        limit: 10,
        withVector: BoolWithVector(false),
        withPayload: BoolWithPayload(true),
      ),
    );

    expect(results, hasLength(3));
    expect((results.first.id as NumIdPointId).value, 1,
        reason: 'nearest to [1,0,0,0] is point id=1');
    expect(results.first.payload, contains('"label"'));
  });
}
