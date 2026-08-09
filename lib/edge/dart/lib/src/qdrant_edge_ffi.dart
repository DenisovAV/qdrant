library qdrant_edge;

import "dart:async";
import "dart:convert";
import "dart:ffi";
import "dart:io" show Platform, File, Directory;
import "dart:isolate";
import "dart:typed_data";
import "package:ffi/ffi.dart";

class BinaryQuantizationParams {
  final Memory? memory;
  final BinaryQuantizationEncoding? encoding;
  final BinaryQuantizationQueryEncoding? queryEncoding;
  BinaryQuantizationParams({
    this.memory = null,
    this.encoding = null,
    this.queryEncoding = null,
  });
}

class FfiConverterBinaryQuantizationParams {
  static BinaryQuantizationParams lift(RustBuffer buf) {
    return FfiConverterBinaryQuantizationParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<BinaryQuantizationParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final encoding_lifted = FfiConverterOptionalBinaryQuantizationEncoding.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final encoding = encoding_lifted.value;
    new_offset += encoding_lifted.bytesRead;
    final queryEncoding_lifted =
        FfiConverterOptionalBinaryQuantizationQueryEncoding.read(
          Uint8List.view(buf.buffer, new_offset),
        );
    final queryEncoding = queryEncoding_lifted.value;
    new_offset += queryEncoding_lifted.bytesRead;
    return LiftRetVal(
      BinaryQuantizationParams(
        memory: memory,
        encoding: encoding,
        queryEncoding: queryEncoding,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(BinaryQuantizationParams value) {
    final total_length =
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBinaryQuantizationEncoding.allocationSize(
          value.encoding,
        ) +
        FfiConverterOptionalBinaryQuantizationQueryEncoding.allocationSize(
          value.queryEncoding,
        ) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(BinaryQuantizationParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBinaryQuantizationEncoding.write(
      value.encoding,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBinaryQuantizationQueryEncoding.write(
      value.queryEncoding,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(BinaryQuantizationParams value) {
    return FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBinaryQuantizationEncoding.allocationSize(
          value.encoding,
        ) +
        FfiConverterOptionalBinaryQuantizationQueryEncoding.allocationSize(
          value.queryEncoding,
        ) +
        0;
  }
}

class EdgeConfig {
  final Map<String, VectorDataConfig> vectorData;
  final Map<String, SparseVectorDataConfig> sparseVectorData;
  EdgeConfig({required this.vectorData, this.sparseVectorData = const {}});
}

class FfiConverterEdgeConfig {
  static EdgeConfig lift(RustBuffer buf) {
    return FfiConverterEdgeConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<EdgeConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vectorData_lifted = FfiConverterMapStringToVectorDataConfig.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vectorData = vectorData_lifted.value;
    new_offset += vectorData_lifted.bytesRead;
    final sparseVectorData_lifted =
        FfiConverterMapStringToSparseVectorDataConfig.read(
          Uint8List.view(buf.buffer, new_offset),
        );
    final sparseVectorData = sparseVectorData_lifted.value;
    new_offset += sparseVectorData_lifted.bytesRead;
    return LiftRetVal(
      EdgeConfig(vectorData: vectorData, sparseVectorData: sparseVectorData),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(EdgeConfig value) {
    final total_length =
        FfiConverterMapStringToVectorDataConfig.allocationSize(
          value.vectorData,
        ) +
        FfiConverterMapStringToSparseVectorDataConfig.allocationSize(
          value.sparseVectorData,
        ) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(EdgeConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterMapStringToVectorDataConfig.write(
      value.vectorData,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterMapStringToSparseVectorDataConfig.write(
      value.sparseVectorData,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(EdgeConfig value) {
    return FfiConverterMapStringToVectorDataConfig.allocationSize(
          value.vectorData,
        ) +
        FfiConverterMapStringToSparseVectorDataConfig.allocationSize(
          value.sparseVectorData,
        ) +
        0;
  }
}

class HnswIndexConfig {
  final int m;
  final int efConstruct;
  final int fullScanThreshold;
  final int maxIndexingThreads;
  final Memory? memory;
  final int? payloadM;
  HnswIndexConfig({
    this.m = 16,
    this.efConstruct = 100,
    this.fullScanThreshold = 10000,
    this.maxIndexingThreads = 0,
    this.memory = null,
    this.payloadM = null,
  });
}

class FfiConverterHnswIndexConfig {
  static HnswIndexConfig lift(RustBuffer buf) {
    return FfiConverterHnswIndexConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<HnswIndexConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final m_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final m = m_lifted.value;
    new_offset += m_lifted.bytesRead;
    final efConstruct_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final efConstruct = efConstruct_lifted.value;
    new_offset += efConstruct_lifted.bytesRead;
    final fullScanThreshold_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final fullScanThreshold = fullScanThreshold_lifted.value;
    new_offset += fullScanThreshold_lifted.bytesRead;
    final maxIndexingThreads_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final maxIndexingThreads = maxIndexingThreads_lifted.value;
    new_offset += maxIndexingThreads_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final payloadM_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final payloadM = payloadM_lifted.value;
    new_offset += payloadM_lifted.bytesRead;
    return LiftRetVal(
      HnswIndexConfig(
        m: m,
        efConstruct: efConstruct,
        fullScanThreshold: fullScanThreshold,
        maxIndexingThreads: maxIndexingThreads,
        memory: memory,
        payloadM: payloadM,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(HnswIndexConfig value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.m) +
        FfiConverterUInt64.allocationSize(value.efConstruct) +
        FfiConverterUInt64.allocationSize(value.fullScanThreshold) +
        FfiConverterUInt64.allocationSize(value.maxIndexingThreads) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalUInt64.allocationSize(value.payloadM) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(HnswIndexConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.m,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.efConstruct,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.fullScanThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.maxIndexingThreads,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.payloadM,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(HnswIndexConfig value) {
    return FfiConverterUInt64.allocationSize(value.m) +
        FfiConverterUInt64.allocationSize(value.efConstruct) +
        FfiConverterUInt64.allocationSize(value.fullScanThreshold) +
        FfiConverterUInt64.allocationSize(value.maxIndexingThreads) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalUInt64.allocationSize(value.payloadM) +
        0;
  }
}

class MultiVectorConfig {
  final MultiVectorComparator comparator;
  MultiVectorConfig({required this.comparator});
}

class FfiConverterMultiVectorConfig {
  static MultiVectorConfig lift(RustBuffer buf) {
    return FfiConverterMultiVectorConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<MultiVectorConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final comparator_lifted = FfiConverterMultiVectorComparator.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final comparator = comparator_lifted.value;
    new_offset += comparator_lifted.bytesRead;
    return LiftRetVal(
      MultiVectorConfig(comparator: comparator),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(MultiVectorConfig value) {
    final total_length =
        FfiConverterMultiVectorComparator.allocationSize(value.comparator) + 0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(MultiVectorConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterMultiVectorComparator.write(
      value.comparator,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(MultiVectorConfig value) {
    return FfiConverterMultiVectorComparator.allocationSize(value.comparator) +
        0;
  }
}

class OptimizersConfig {
  final double? deletedThreshold;
  final int? vacuumMinVectorNumber;
  final int? defaultSegmentNumber;
  final int? maxSegmentSizeKb;
  final int? indexingThresholdKb;
  final bool? preventUnoptimized;
  OptimizersConfig({
    this.deletedThreshold = null,
    this.vacuumMinVectorNumber = null,
    this.defaultSegmentNumber = null,
    this.maxSegmentSizeKb = null,
    this.indexingThresholdKb = null,
    this.preventUnoptimized = null,
  });
}

class FfiConverterOptimizersConfig {
  static OptimizersConfig lift(RustBuffer buf) {
    return FfiConverterOptimizersConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<OptimizersConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final deletedThreshold_lifted = FfiConverterOptionalDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final deletedThreshold = deletedThreshold_lifted.value;
    new_offset += deletedThreshold_lifted.bytesRead;
    final vacuumMinVectorNumber_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vacuumMinVectorNumber = vacuumMinVectorNumber_lifted.value;
    new_offset += vacuumMinVectorNumber_lifted.bytesRead;
    final defaultSegmentNumber_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final defaultSegmentNumber = defaultSegmentNumber_lifted.value;
    new_offset += defaultSegmentNumber_lifted.bytesRead;
    final maxSegmentSizeKb_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final maxSegmentSizeKb = maxSegmentSizeKb_lifted.value;
    new_offset += maxSegmentSizeKb_lifted.bytesRead;
    final indexingThresholdKb_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final indexingThresholdKb = indexingThresholdKb_lifted.value;
    new_offset += indexingThresholdKb_lifted.bytesRead;
    final preventUnoptimized_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final preventUnoptimized = preventUnoptimized_lifted.value;
    new_offset += preventUnoptimized_lifted.bytesRead;
    return LiftRetVal(
      OptimizersConfig(
        deletedThreshold: deletedThreshold,
        vacuumMinVectorNumber: vacuumMinVectorNumber,
        defaultSegmentNumber: defaultSegmentNumber,
        maxSegmentSizeKb: maxSegmentSizeKb,
        indexingThresholdKb: indexingThresholdKb,
        preventUnoptimized: preventUnoptimized,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(OptimizersConfig value) {
    final total_length =
        FfiConverterOptionalDouble64.allocationSize(value.deletedThreshold) +
        FfiConverterOptionalUInt64.allocationSize(value.vacuumMinVectorNumber) +
        FfiConverterOptionalUInt64.allocationSize(value.defaultSegmentNumber) +
        FfiConverterOptionalUInt64.allocationSize(value.maxSegmentSizeKb) +
        FfiConverterOptionalUInt64.allocationSize(value.indexingThresholdKb) +
        FfiConverterOptionalBool.allocationSize(value.preventUnoptimized) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(OptimizersConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalDouble64.write(
      value.deletedThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.vacuumMinVectorNumber,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.defaultSegmentNumber,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.maxSegmentSizeKb,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.indexingThresholdKb,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.preventUnoptimized,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(OptimizersConfig value) {
    return FfiConverterOptionalDouble64.allocationSize(value.deletedThreshold) +
        FfiConverterOptionalUInt64.allocationSize(value.vacuumMinVectorNumber) +
        FfiConverterOptionalUInt64.allocationSize(value.defaultSegmentNumber) +
        FfiConverterOptionalUInt64.allocationSize(value.maxSegmentSizeKb) +
        FfiConverterOptionalUInt64.allocationSize(value.indexingThresholdKb) +
        FfiConverterOptionalBool.allocationSize(value.preventUnoptimized) +
        0;
  }
}

class ProductQuantizationParams {
  final CompressionRatio compression;
  final Memory? memory;
  ProductQuantizationParams({required this.compression, this.memory = null});
}

class FfiConverterProductQuantizationParams {
  static ProductQuantizationParams lift(RustBuffer buf) {
    return FfiConverterProductQuantizationParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ProductQuantizationParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final compression_lifted = FfiConverterCompressionRatio.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final compression = compression_lifted.value;
    new_offset += compression_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    return LiftRetVal(
      ProductQuantizationParams(compression: compression, memory: memory),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ProductQuantizationParams value) {
    final total_length =
        FfiConverterCompressionRatio.allocationSize(value.compression) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ProductQuantizationParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterCompressionRatio.write(
      value.compression,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ProductQuantizationParams value) {
    return FfiConverterCompressionRatio.allocationSize(value.compression) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        0;
  }
}

class ScalarQuantizationParams {
  final ScalarType type;
  final double? quantile;
  final Memory? memory;
  ScalarQuantizationParams({
    required this.type,
    this.quantile = null,
    this.memory = null,
  });
}

class FfiConverterScalarQuantizationParams {
  static ScalarQuantizationParams lift(RustBuffer buf) {
    return FfiConverterScalarQuantizationParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ScalarQuantizationParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final type_lifted = FfiConverterScalarType.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final type = type_lifted.value;
    new_offset += type_lifted.bytesRead;
    final quantile_lifted = FfiConverterOptionalDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final quantile = quantile_lifted.value;
    new_offset += quantile_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    return LiftRetVal(
      ScalarQuantizationParams(type: type, quantile: quantile, memory: memory),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ScalarQuantizationParams value) {
    final total_length =
        FfiConverterScalarType.allocationSize(value.type) +
        FfiConverterOptionalDouble32.allocationSize(value.quantile) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ScalarQuantizationParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterScalarType.write(
      value.type,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble32.write(
      value.quantile,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ScalarQuantizationParams value) {
    return FfiConverterScalarType.allocationSize(value.type) +
        FfiConverterOptionalDouble32.allocationSize(value.quantile) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        0;
  }
}

class SparseVectorDataConfig {
  final int? fullScanThreshold;
  final VectorStorageDatatype? datatype;
  final Modifier? modifier;
  SparseVectorDataConfig({
    this.fullScanThreshold = null,
    this.datatype = null,
    this.modifier = null,
  });
}

class FfiConverterSparseVectorDataConfig {
  static SparseVectorDataConfig lift(RustBuffer buf) {
    return FfiConverterSparseVectorDataConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SparseVectorDataConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final fullScanThreshold_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final fullScanThreshold = fullScanThreshold_lifted.value;
    new_offset += fullScanThreshold_lifted.bytesRead;
    final datatype_lifted = FfiConverterOptionalVectorStorageDatatype.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final datatype = datatype_lifted.value;
    new_offset += datatype_lifted.bytesRead;
    final modifier_lifted = FfiConverterOptionalModifier.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final modifier = modifier_lifted.value;
    new_offset += modifier_lifted.bytesRead;
    return LiftRetVal(
      SparseVectorDataConfig(
        fullScanThreshold: fullScanThreshold,
        datatype: datatype,
        modifier: modifier,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SparseVectorDataConfig value) {
    final total_length =
        FfiConverterOptionalUInt64.allocationSize(value.fullScanThreshold) +
        FfiConverterOptionalVectorStorageDatatype.allocationSize(
          value.datatype,
        ) +
        FfiConverterOptionalModifier.allocationSize(value.modifier) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SparseVectorDataConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalUInt64.write(
      value.fullScanThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalVectorStorageDatatype.write(
      value.datatype,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalModifier.write(
      value.modifier,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SparseVectorDataConfig value) {
    return FfiConverterOptionalUInt64.allocationSize(value.fullScanThreshold) +
        FfiConverterOptionalVectorStorageDatatype.allocationSize(
          value.datatype,
        ) +
        FfiConverterOptionalModifier.allocationSize(value.modifier) +
        0;
  }
}

class TurboQuantizationParams {
  final Memory? memory;
  final TurboQuantBitSize? bits;
  TurboQuantizationParams({this.memory = null, this.bits = null});
}

class FfiConverterTurboQuantizationParams {
  static TurboQuantizationParams lift(RustBuffer buf) {
    return FfiConverterTurboQuantizationParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TurboQuantizationParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final bits_lifted = FfiConverterOptionalTurboQuantBitSize.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final bits = bits_lifted.value;
    new_offset += bits_lifted.bytesRead;
    return LiftRetVal(
      TurboQuantizationParams(memory: memory, bits: bits),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(TurboQuantizationParams value) {
    final total_length =
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalTurboQuantBitSize.allocationSize(value.bits) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(TurboQuantizationParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalTurboQuantBitSize.write(
      value.bits,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(TurboQuantizationParams value) {
    return FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalTurboQuantBitSize.allocationSize(value.bits) +
        0;
  }
}

class VectorDataConfig {
  final int size;
  final Distance distance;
  final QuantizationConfig? quantizationConfig;
  final MultiVectorConfig? multivectorConfig;
  final VectorStorageDatatype? datatype;
  final HnswIndexConfig? hnswConfig;
  VectorDataConfig({
    required this.size,
    required this.distance,
    this.quantizationConfig = null,
    this.multivectorConfig = null,
    this.datatype = null,
    this.hnswConfig = null,
  });
}

class FfiConverterVectorDataConfig {
  static VectorDataConfig lift(RustBuffer buf) {
    return FfiConverterVectorDataConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<VectorDataConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final size_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final size = size_lifted.value;
    new_offset += size_lifted.bytesRead;
    final distance_lifted = FfiConverterDistance.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final distance = distance_lifted.value;
    new_offset += distance_lifted.bytesRead;
    final quantizationConfig_lifted =
        FfiConverterOptionalQuantizationConfig.read(
          Uint8List.view(buf.buffer, new_offset),
        );
    final quantizationConfig = quantizationConfig_lifted.value;
    new_offset += quantizationConfig_lifted.bytesRead;
    final multivectorConfig_lifted = FfiConverterOptionalMultiVectorConfig.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final multivectorConfig = multivectorConfig_lifted.value;
    new_offset += multivectorConfig_lifted.bytesRead;
    final datatype_lifted = FfiConverterOptionalVectorStorageDatatype.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final datatype = datatype_lifted.value;
    new_offset += datatype_lifted.bytesRead;
    final hnswConfig_lifted = FfiConverterOptionalHnswIndexConfig.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final hnswConfig = hnswConfig_lifted.value;
    new_offset += hnswConfig_lifted.bytesRead;
    return LiftRetVal(
      VectorDataConfig(
        size: size,
        distance: distance,
        quantizationConfig: quantizationConfig,
        multivectorConfig: multivectorConfig,
        datatype: datatype,
        hnswConfig: hnswConfig,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(VectorDataConfig value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.size) +
        FfiConverterDistance.allocationSize(value.distance) +
        FfiConverterOptionalQuantizationConfig.allocationSize(
          value.quantizationConfig,
        ) +
        FfiConverterOptionalMultiVectorConfig.allocationSize(
          value.multivectorConfig,
        ) +
        FfiConverterOptionalVectorStorageDatatype.allocationSize(
          value.datatype,
        ) +
        FfiConverterOptionalHnswIndexConfig.allocationSize(value.hnswConfig) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(VectorDataConfig value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.size,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDistance.write(
      value.distance,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalQuantizationConfig.write(
      value.quantizationConfig,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMultiVectorConfig.write(
      value.multivectorConfig,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalVectorStorageDatatype.write(
      value.datatype,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalHnswIndexConfig.write(
      value.hnswConfig,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(VectorDataConfig value) {
    return FfiConverterUInt64.allocationSize(value.size) +
        FfiConverterDistance.allocationSize(value.distance) +
        FfiConverterOptionalQuantizationConfig.allocationSize(
          value.quantizationConfig,
        ) +
        FfiConverterOptionalMultiVectorConfig.allocationSize(
          value.multivectorConfig,
        ) +
        FfiConverterOptionalVectorStorageDatatype.allocationSize(
          value.datatype,
        ) +
        FfiConverterOptionalHnswIndexConfig.allocationSize(value.hnswConfig) +
        0;
  }
}

class FieldCondition {
  final String key;
  final Match? match;
  final RangeFloat? range;
  final RangeDatetime? datetimeRange;
  final GeoBoundingBox? geoBoundingBox;
  final GeoRadius? geoRadius;
  final GeoPolygon? geoPolygon;
  final ValuesCount? valuesCount;
  FieldCondition({
    required this.key,
    this.match = null,
    this.range = null,
    this.datetimeRange = null,
    this.geoBoundingBox = null,
    this.geoRadius = null,
    this.geoPolygon = null,
    this.valuesCount = null,
  });
}

class FfiConverterFieldCondition {
  static FieldCondition lift(RustBuffer buf) {
    return FfiConverterFieldCondition.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FieldCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    final match_lifted = FfiConverterOptionalMatch.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final match = match_lifted.value;
    new_offset += match_lifted.bytesRead;
    final range_lifted = FfiConverterOptionalRangeFloat.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final range = range_lifted.value;
    new_offset += range_lifted.bytesRead;
    final datetimeRange_lifted = FfiConverterOptionalRangeDatetime.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final datetimeRange = datetimeRange_lifted.value;
    new_offset += datetimeRange_lifted.bytesRead;
    final geoBoundingBox_lifted = FfiConverterOptionalGeoBoundingBox.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final geoBoundingBox = geoBoundingBox_lifted.value;
    new_offset += geoBoundingBox_lifted.bytesRead;
    final geoRadius_lifted = FfiConverterOptionalGeoRadius.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final geoRadius = geoRadius_lifted.value;
    new_offset += geoRadius_lifted.bytesRead;
    final geoPolygon_lifted = FfiConverterOptionalGeoPolygon.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final geoPolygon = geoPolygon_lifted.value;
    new_offset += geoPolygon_lifted.bytesRead;
    final valuesCount_lifted = FfiConverterOptionalValuesCount.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final valuesCount = valuesCount_lifted.value;
    new_offset += valuesCount_lifted.bytesRead;
    return LiftRetVal(
      FieldCondition(
        key: key,
        match: match,
        range: range,
        datetimeRange: datetimeRange,
        geoBoundingBox: geoBoundingBox,
        geoRadius: geoRadius,
        geoPolygon: geoPolygon,
        valuesCount: valuesCount,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FieldCondition value) {
    final total_length =
        FfiConverterString.allocationSize(value.key) +
        FfiConverterOptionalMatch.allocationSize(value.match) +
        FfiConverterOptionalRangeFloat.allocationSize(value.range) +
        FfiConverterOptionalRangeDatetime.allocationSize(value.datetimeRange) +
        FfiConverterOptionalGeoBoundingBox.allocationSize(
          value.geoBoundingBox,
        ) +
        FfiConverterOptionalGeoRadius.allocationSize(value.geoRadius) +
        FfiConverterOptionalGeoPolygon.allocationSize(value.geoPolygon) +
        FfiConverterOptionalValuesCount.allocationSize(value.valuesCount) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FieldCondition value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterString.write(
      value.key,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMatch.write(
      value.match,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalRangeFloat.write(
      value.range,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalRangeDatetime.write(
      value.datetimeRange,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalGeoBoundingBox.write(
      value.geoBoundingBox,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalGeoRadius.write(
      value.geoRadius,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalGeoPolygon.write(
      value.geoPolygon,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalValuesCount.write(
      value.valuesCount,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FieldCondition value) {
    return FfiConverterString.allocationSize(value.key) +
        FfiConverterOptionalMatch.allocationSize(value.match) +
        FfiConverterOptionalRangeFloat.allocationSize(value.range) +
        FfiConverterOptionalRangeDatetime.allocationSize(value.datetimeRange) +
        FfiConverterOptionalGeoBoundingBox.allocationSize(
          value.geoBoundingBox,
        ) +
        FfiConverterOptionalGeoRadius.allocationSize(value.geoRadius) +
        FfiConverterOptionalGeoPolygon.allocationSize(value.geoPolygon) +
        FfiConverterOptionalValuesCount.allocationSize(value.valuesCount) +
        0;
  }
}

class Filter {
  final List<Condition>? must;
  final List<Condition>? should;
  final List<Condition>? mustNot;
  final MinShould? minShould;
  Filter({
    this.must = null,
    this.should = null,
    this.mustNot = null,
    this.minShould = null,
  });
}

class FfiConverterFilter {
  static Filter lift(RustBuffer buf) {
    return FfiConverterFilter.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Filter> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final must_lifted = FfiConverterOptionalSequenceCondition.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final must = must_lifted.value;
    new_offset += must_lifted.bytesRead;
    final should_lifted = FfiConverterOptionalSequenceCondition.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final should = should_lifted.value;
    new_offset += should_lifted.bytesRead;
    final mustNot_lifted = FfiConverterOptionalSequenceCondition.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final mustNot = mustNot_lifted.value;
    new_offset += mustNot_lifted.bytesRead;
    final minShould_lifted = FfiConverterOptionalMinShould.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final minShould = minShould_lifted.value;
    new_offset += minShould_lifted.bytesRead;
    return LiftRetVal(
      Filter(
        must: must,
        should: should,
        mustNot: mustNot,
        minShould: minShould,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Filter value) {
    final total_length =
        FfiConverterOptionalSequenceCondition.allocationSize(value.must) +
        FfiConverterOptionalSequenceCondition.allocationSize(value.should) +
        FfiConverterOptionalSequenceCondition.allocationSize(value.mustNot) +
        FfiConverterOptionalMinShould.allocationSize(value.minShould) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Filter value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalSequenceCondition.write(
      value.must,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSequenceCondition.write(
      value.should,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSequenceCondition.write(
      value.mustNot,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMinShould.write(
      value.minShould,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Filter value) {
    return FfiConverterOptionalSequenceCondition.allocationSize(value.must) +
        FfiConverterOptionalSequenceCondition.allocationSize(value.should) +
        FfiConverterOptionalSequenceCondition.allocationSize(value.mustNot) +
        FfiConverterOptionalMinShould.allocationSize(value.minShould) +
        0;
  }
}

class GeoBoundingBox {
  final GeoPoint topLeft;
  final GeoPoint bottomRight;
  GeoBoundingBox({required this.topLeft, required this.bottomRight});
}

class FfiConverterGeoBoundingBox {
  static GeoBoundingBox lift(RustBuffer buf) {
    return FfiConverterGeoBoundingBox.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoBoundingBox> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final topLeft_lifted = FfiConverterGeoPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final topLeft = topLeft_lifted.value;
    new_offset += topLeft_lifted.bytesRead;
    final bottomRight_lifted = FfiConverterGeoPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final bottomRight = bottomRight_lifted.value;
    new_offset += bottomRight_lifted.bytesRead;
    return LiftRetVal(
      GeoBoundingBox(topLeft: topLeft, bottomRight: bottomRight),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoBoundingBox value) {
    final total_length =
        FfiConverterGeoPoint.allocationSize(value.topLeft) +
        FfiConverterGeoPoint.allocationSize(value.bottomRight) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoBoundingBox value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterGeoPoint.write(
      value.topLeft,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterGeoPoint.write(
      value.bottomRight,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoBoundingBox value) {
    return FfiConverterGeoPoint.allocationSize(value.topLeft) +
        FfiConverterGeoPoint.allocationSize(value.bottomRight) +
        0;
  }
}

class GeoLineString {
  final List<GeoPoint> points;
  GeoLineString({required this.points});
}

class FfiConverterGeoLineString {
  static GeoLineString lift(RustBuffer buf) {
    return FfiConverterGeoLineString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoLineString> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final points_lifted = FfiConverterSequenceGeoPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final points = points_lifted.value;
    new_offset += points_lifted.bytesRead;
    return LiftRetVal(
      GeoLineString(points: points),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoLineString value) {
    final total_length =
        FfiConverterSequenceGeoPoint.allocationSize(value.points) + 0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoLineString value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequenceGeoPoint.write(
      value.points,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoLineString value) {
    return FfiConverterSequenceGeoPoint.allocationSize(value.points) + 0;
  }
}

class GeoPoint {
  final double lon;
  final double lat;
  GeoPoint({required this.lon, required this.lat});
}

class FfiConverterGeoPoint {
  static GeoPoint lift(RustBuffer buf) {
    return FfiConverterGeoPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoPoint> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final lon_lifted = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lon = lon_lifted.value;
    new_offset += lon_lifted.bytesRead;
    final lat_lifted = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lat = lat_lifted.value;
    new_offset += lat_lifted.bytesRead;
    return LiftRetVal(
      GeoPoint(lon: lon, lat: lat),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoPoint value) {
    final total_length =
        FfiConverterDouble64.allocationSize(value.lon) +
        FfiConverterDouble64.allocationSize(value.lat) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoPoint value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterDouble64.write(
      value.lon,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble64.write(
      value.lat,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoPoint value) {
    return FfiConverterDouble64.allocationSize(value.lon) +
        FfiConverterDouble64.allocationSize(value.lat) +
        0;
  }
}

class GeoPolygon {
  final GeoLineString exterior;
  final List<GeoLineString>? interiors;
  GeoPolygon({required this.exterior, this.interiors = null});
}

class FfiConverterGeoPolygon {
  static GeoPolygon lift(RustBuffer buf) {
    return FfiConverterGeoPolygon.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoPolygon> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final exterior_lifted = FfiConverterGeoLineString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final exterior = exterior_lifted.value;
    new_offset += exterior_lifted.bytesRead;
    final interiors_lifted = FfiConverterOptionalSequenceGeoLineString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final interiors = interiors_lifted.value;
    new_offset += interiors_lifted.bytesRead;
    return LiftRetVal(
      GeoPolygon(exterior: exterior, interiors: interiors),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoPolygon value) {
    final total_length =
        FfiConverterGeoLineString.allocationSize(value.exterior) +
        FfiConverterOptionalSequenceGeoLineString.allocationSize(
          value.interiors,
        ) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoPolygon value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterGeoLineString.write(
      value.exterior,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSequenceGeoLineString.write(
      value.interiors,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoPolygon value) {
    return FfiConverterGeoLineString.allocationSize(value.exterior) +
        FfiConverterOptionalSequenceGeoLineString.allocationSize(
          value.interiors,
        ) +
        0;
  }
}

class GeoRadius {
  final GeoPoint center;
  final double radius;
  GeoRadius({required this.center, required this.radius});
}

class FfiConverterGeoRadius {
  static GeoRadius lift(RustBuffer buf) {
    return FfiConverterGeoRadius.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoRadius> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final center_lifted = FfiConverterGeoPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final center = center_lifted.value;
    new_offset += center_lifted.bytesRead;
    final radius_lifted = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final radius = radius_lifted.value;
    new_offset += radius_lifted.bytesRead;
    return LiftRetVal(
      GeoRadius(center: center, radius: radius),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoRadius value) {
    final total_length =
        FfiConverterGeoPoint.allocationSize(value.center) +
        FfiConverterDouble64.allocationSize(value.radius) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoRadius value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterGeoPoint.write(
      value.center,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble64.write(
      value.radius,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoRadius value) {
    return FfiConverterGeoPoint.allocationSize(value.center) +
        FfiConverterDouble64.allocationSize(value.radius) +
        0;
  }
}

class MinShould {
  final List<Condition> conditions;
  final int minCount;
  MinShould({required this.conditions, required this.minCount});
}

class FfiConverterMinShould {
  static MinShould lift(RustBuffer buf) {
    return FfiConverterMinShould.read(buf.asUint8List()).value;
  }

  static LiftRetVal<MinShould> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final conditions_lifted = FfiConverterSequenceCondition.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final conditions = conditions_lifted.value;
    new_offset += conditions_lifted.bytesRead;
    final minCount_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final minCount = minCount_lifted.value;
    new_offset += minCount_lifted.bytesRead;
    return LiftRetVal(
      MinShould(conditions: conditions, minCount: minCount),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(MinShould value) {
    final total_length =
        FfiConverterSequenceCondition.allocationSize(value.conditions) +
        FfiConverterUInt64.allocationSize(value.minCount) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(MinShould value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequenceCondition.write(
      value.conditions,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.minCount,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(MinShould value) {
    return FfiConverterSequenceCondition.allocationSize(value.conditions) +
        FfiConverterUInt64.allocationSize(value.minCount) +
        0;
  }
}

class RangeDatetime {
  final String? gte;
  final String? gt;
  final String? lte;
  final String? lt;
  RangeDatetime({
    this.gte = null,
    this.gt = null,
    this.lte = null,
    this.lt = null,
  });
}

class FfiConverterRangeDatetime {
  static RangeDatetime lift(RustBuffer buf) {
    return FfiConverterRangeDatetime.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RangeDatetime> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final gte_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gte = gte_lifted.value;
    new_offset += gte_lifted.bytesRead;
    final gt_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gt = gt_lifted.value;
    new_offset += gt_lifted.bytesRead;
    final lte_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lte = lte_lifted.value;
    new_offset += lte_lifted.bytesRead;
    final lt_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lt = lt_lifted.value;
    new_offset += lt_lifted.bytesRead;
    return LiftRetVal(
      RangeDatetime(gte: gte, gt: gt, lte: lte, lt: lt),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RangeDatetime value) {
    final total_length =
        FfiConverterOptionalString.allocationSize(value.gte) +
        FfiConverterOptionalString.allocationSize(value.gt) +
        FfiConverterOptionalString.allocationSize(value.lte) +
        FfiConverterOptionalString.allocationSize(value.lt) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RangeDatetime value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalString.write(
      value.gte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.gt,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.lte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.lt,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RangeDatetime value) {
    return FfiConverterOptionalString.allocationSize(value.gte) +
        FfiConverterOptionalString.allocationSize(value.gt) +
        FfiConverterOptionalString.allocationSize(value.lte) +
        FfiConverterOptionalString.allocationSize(value.lt) +
        0;
  }
}

class RangeFloat {
  final double? gte;
  final double? gt;
  final double? lte;
  final double? lt;
  RangeFloat({
    this.gte = null,
    this.gt = null,
    this.lte = null,
    this.lt = null,
  });
}

class FfiConverterRangeFloat {
  static RangeFloat lift(RustBuffer buf) {
    return FfiConverterRangeFloat.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RangeFloat> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final gte_lifted = FfiConverterOptionalDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gte = gte_lifted.value;
    new_offset += gte_lifted.bytesRead;
    final gt_lifted = FfiConverterOptionalDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gt = gt_lifted.value;
    new_offset += gt_lifted.bytesRead;
    final lte_lifted = FfiConverterOptionalDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lte = lte_lifted.value;
    new_offset += lte_lifted.bytesRead;
    final lt_lifted = FfiConverterOptionalDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lt = lt_lifted.value;
    new_offset += lt_lifted.bytesRead;
    return LiftRetVal(
      RangeFloat(gte: gte, gt: gt, lte: lte, lt: lt),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RangeFloat value) {
    final total_length =
        FfiConverterOptionalDouble64.allocationSize(value.gte) +
        FfiConverterOptionalDouble64.allocationSize(value.gt) +
        FfiConverterOptionalDouble64.allocationSize(value.lte) +
        FfiConverterOptionalDouble64.allocationSize(value.lt) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RangeFloat value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalDouble64.write(
      value.gte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble64.write(
      value.gt,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble64.write(
      value.lte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble64.write(
      value.lt,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RangeFloat value) {
    return FfiConverterOptionalDouble64.allocationSize(value.gte) +
        FfiConverterOptionalDouble64.allocationSize(value.gt) +
        FfiConverterOptionalDouble64.allocationSize(value.lte) +
        FfiConverterOptionalDouble64.allocationSize(value.lt) +
        0;
  }
}

class ValuesCount {
  final int? gte;
  final int? gt;
  final int? lte;
  final int? lt;
  ValuesCount({
    this.gte = null,
    this.gt = null,
    this.lte = null,
    this.lt = null,
  });
}

class FfiConverterValuesCount {
  static ValuesCount lift(RustBuffer buf) {
    return FfiConverterValuesCount.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ValuesCount> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final gte_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gte = gte_lifted.value;
    new_offset += gte_lifted.bytesRead;
    final gt_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final gt = gt_lifted.value;
    new_offset += gt_lifted.bytesRead;
    final lte_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lte = lte_lifted.value;
    new_offset += lte_lifted.bytesRead;
    final lt_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lt = lt_lifted.value;
    new_offset += lt_lifted.bytesRead;
    return LiftRetVal(
      ValuesCount(gte: gte, gt: gt, lte: lte, lt: lt),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ValuesCount value) {
    final total_length =
        FfiConverterOptionalUInt64.allocationSize(value.gte) +
        FfiConverterOptionalUInt64.allocationSize(value.gt) +
        FfiConverterOptionalUInt64.allocationSize(value.lte) +
        FfiConverterOptionalUInt64.allocationSize(value.lt) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ValuesCount value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalUInt64.write(
      value.gte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.gt,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.lte,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.lt,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ValuesCount value) {
    return FfiConverterOptionalUInt64.allocationSize(value.gte) +
        FfiConverterOptionalUInt64.allocationSize(value.gt) +
        FfiConverterOptionalUInt64.allocationSize(value.lte) +
        FfiConverterOptionalUInt64.allocationSize(value.lt) +
        0;
  }
}

class CountRequest {
  final Filter? filter;
  final bool exact;
  CountRequest({this.filter = null, this.exact = true});
}

class FfiConverterCountRequest {
  static CountRequest lift(RustBuffer buf) {
    return FfiConverterCountRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<CountRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final exact_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final exact = exact_lifted.value;
    new_offset += exact_lifted.bytesRead;
    return LiftRetVal(
      CountRequest(filter: filter, exact: exact),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(CountRequest value) {
    final total_length =
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterBool.allocationSize(value.exact) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(CountRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterBool.write(
      value.exact,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(CountRequest value) {
    return FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterBool.allocationSize(value.exact) +
        0;
  }
}

class FacetHit {
  final String value;
  final int count;
  FacetHit({required this.value, required this.count});
}

class FfiConverterFacetHit {
  static FacetHit lift(RustBuffer buf) {
    return FfiConverterFacetHit.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FacetHit> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    final count_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final count = count_lifted.value;
    new_offset += count_lifted.bytesRead;
    return LiftRetVal(
      FacetHit(value: value, count: count),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FacetHit value) {
    final total_length =
        FfiConverterString.allocationSize(value.value) +
        FfiConverterUInt64.allocationSize(value.count) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FacetHit value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterString.write(
      value.value,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.count,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FacetHit value) {
    return FfiConverterString.allocationSize(value.value) +
        FfiConverterUInt64.allocationSize(value.count) +
        0;
  }
}

class FacetRequest {
  final String key;
  final int limit;
  final bool exact;
  final Filter? filter;
  FacetRequest({
    required this.key,
    this.limit = 10,
    this.exact = false,
    this.filter = null,
  });
}

class FfiConverterFacetRequest {
  static FacetRequest lift(RustBuffer buf) {
    return FfiConverterFacetRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FacetRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    final limit_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limit = limit_lifted.value;
    new_offset += limit_lifted.bytesRead;
    final exact_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final exact = exact_lifted.value;
    new_offset += exact_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    return LiftRetVal(
      FacetRequest(key: key, limit: limit, exact: exact, filter: filter),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FacetRequest value) {
    final total_length =
        FfiConverterString.allocationSize(value.key) +
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterBool.allocationSize(value.exact) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FacetRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterString.write(
      value.key,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.limit,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterBool.write(
      value.exact,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FacetRequest value) {
    return FfiConverterString.allocationSize(value.key) +
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterBool.allocationSize(value.exact) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        0;
  }
}

class FacetResponse {
  final List<FacetHit> hits;
  FacetResponse({required this.hits});
}

class FfiConverterFacetResponse {
  static FacetResponse lift(RustBuffer buf) {
    return FfiConverterFacetResponse.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FacetResponse> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final hits_lifted = FfiConverterSequenceFacetHit.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final hits = hits_lifted.value;
    new_offset += hits_lifted.bytesRead;
    return LiftRetVal(
      FacetResponse(hits: hits),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FacetResponse value) {
    final total_length =
        FfiConverterSequenceFacetHit.allocationSize(value.hits) + 0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FacetResponse value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequenceFacetHit.write(
      value.hits,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FacetResponse value) {
    return FfiConverterSequenceFacetHit.allocationSize(value.hits) + 0;
  }
}

class Group {
  final GroupId key;
  final List<ScoredPoint> hits;
  Group({required this.key, required this.hits});
}

class FfiConverterGroup {
  static Group lift(RustBuffer buf) {
    return FfiConverterGroup.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Group> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterGroupId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    final hits_lifted = FfiConverterSequenceScoredPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final hits = hits_lifted.value;
    new_offset += hits_lifted.bytesRead;
    return LiftRetVal(
      Group(key: key, hits: hits),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Group value) {
    final total_length =
        FfiConverterGroupId.allocationSize(value.key) +
        FfiConverterSequenceScoredPoint.allocationSize(value.hits) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Group value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterGroupId.write(
      value.key,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceScoredPoint.write(
      value.hits,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Group value) {
    return FfiConverterGroupId.allocationSize(value.key) +
        FfiConverterSequenceScoredPoint.allocationSize(value.hits) +
        0;
  }
}

class GroupRequest {
  final QueryRequest query;
  final String groupBy;
  final int groups;
  final int groupSize;
  GroupRequest({
    required this.query,
    required this.groupBy,
    required this.groups,
    required this.groupSize,
  });
}

class FfiConverterGroupRequest {
  static GroupRequest lift(RustBuffer buf) {
    return FfiConverterGroupRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GroupRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final query_lifted = FfiConverterQueryRequest.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final query = query_lifted.value;
    new_offset += query_lifted.bytesRead;
    final groupBy_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final groupBy = groupBy_lifted.value;
    new_offset += groupBy_lifted.bytesRead;
    final groups_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final groups = groups_lifted.value;
    new_offset += groups_lifted.bytesRead;
    final groupSize_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final groupSize = groupSize_lifted.value;
    new_offset += groupSize_lifted.bytesRead;
    return LiftRetVal(
      GroupRequest(
        query: query,
        groupBy: groupBy,
        groups: groups,
        groupSize: groupSize,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GroupRequest value) {
    final total_length =
        FfiConverterQueryRequest.allocationSize(value.query) +
        FfiConverterString.allocationSize(value.groupBy) +
        FfiConverterUInt64.allocationSize(value.groups) +
        FfiConverterUInt64.allocationSize(value.groupSize) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GroupRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterQueryRequest.write(
      value.query,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterString.write(
      value.groupBy,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.groups,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.groupSize,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GroupRequest value) {
    return FfiConverterQueryRequest.allocationSize(value.query) +
        FfiConverterString.allocationSize(value.groupBy) +
        FfiConverterUInt64.allocationSize(value.groups) +
        FfiConverterUInt64.allocationSize(value.groupSize) +
        0;
  }
}

class ShardInfo {
  final int segmentsCount;
  final int pointsCount;
  final int indexedVectorsCount;
  final Map<String, PayloadIndexInfo> payloadSchema;
  ShardInfo({
    required this.segmentsCount,
    required this.pointsCount,
    required this.indexedVectorsCount,
    required this.payloadSchema,
  });
}

class FfiConverterShardInfo {
  static ShardInfo lift(RustBuffer buf) {
    return FfiConverterShardInfo.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ShardInfo> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final segmentsCount_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final segmentsCount = segmentsCount_lifted.value;
    new_offset += segmentsCount_lifted.bytesRead;
    final pointsCount_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final pointsCount = pointsCount_lifted.value;
    new_offset += pointsCount_lifted.bytesRead;
    final indexedVectorsCount_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final indexedVectorsCount = indexedVectorsCount_lifted.value;
    new_offset += indexedVectorsCount_lifted.bytesRead;
    final payloadSchema_lifted = FfiConverterMapStringToPayloadIndexInfo.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final payloadSchema = payloadSchema_lifted.value;
    new_offset += payloadSchema_lifted.bytesRead;
    return LiftRetVal(
      ShardInfo(
        segmentsCount: segmentsCount,
        pointsCount: pointsCount,
        indexedVectorsCount: indexedVectorsCount,
        payloadSchema: payloadSchema,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ShardInfo value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.segmentsCount) +
        FfiConverterUInt64.allocationSize(value.pointsCount) +
        FfiConverterUInt64.allocationSize(value.indexedVectorsCount) +
        FfiConverterMapStringToPayloadIndexInfo.allocationSize(
          value.payloadSchema,
        ) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ShardInfo value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.segmentsCount,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.pointsCount,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.indexedVectorsCount,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterMapStringToPayloadIndexInfo.write(
      value.payloadSchema,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ShardInfo value) {
    return FfiConverterUInt64.allocationSize(value.segmentsCount) +
        FfiConverterUInt64.allocationSize(value.pointsCount) +
        FfiConverterUInt64.allocationSize(value.indexedVectorsCount) +
        FfiConverterMapStringToPayloadIndexInfo.allocationSize(
          value.payloadSchema,
        ) +
        0;
  }
}

class SearchMatrixRequest {
  final int sampleSize;
  final int limitPerSample;
  final Filter? filter;
  final String? using;
  SearchMatrixRequest({
    required this.sampleSize,
    required this.limitPerSample,
    this.filter = null,
    this.using = null,
  });
}

class FfiConverterSearchMatrixRequest {
  static SearchMatrixRequest lift(RustBuffer buf) {
    return FfiConverterSearchMatrixRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SearchMatrixRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final sampleSize_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final sampleSize = sampleSize_lifted.value;
    new_offset += sampleSize_lifted.bytesRead;
    final limitPerSample_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limitPerSample = limitPerSample_lifted.value;
    new_offset += limitPerSample_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(
      SearchMatrixRequest(
        sampleSize: sampleSize,
        limitPerSample: limitPerSample,
        filter: filter,
        using: using,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SearchMatrixRequest value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.sampleSize) +
        FfiConverterUInt64.allocationSize(value.limitPerSample) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalString.allocationSize(value.using) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SearchMatrixRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.sampleSize,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.limitPerSample,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SearchMatrixRequest value) {
    return FfiConverterUInt64.allocationSize(value.sampleSize) +
        FfiConverterUInt64.allocationSize(value.limitPerSample) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalString.allocationSize(value.using) +
        0;
  }
}

class SearchMatrixResponse {
  final List<PointId> sampleIds;
  final List<List<ScoredPoint>> nearests;
  SearchMatrixResponse({required this.sampleIds, required this.nearests});
}

class FfiConverterSearchMatrixResponse {
  static SearchMatrixResponse lift(RustBuffer buf) {
    return FfiConverterSearchMatrixResponse.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SearchMatrixResponse> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final sampleIds_lifted = FfiConverterSequencePointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final sampleIds = sampleIds_lifted.value;
    new_offset += sampleIds_lifted.bytesRead;
    final nearests_lifted = FfiConverterSequenceSequenceScoredPoint.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final nearests = nearests_lifted.value;
    new_offset += nearests_lifted.bytesRead;
    return LiftRetVal(
      SearchMatrixResponse(sampleIds: sampleIds, nearests: nearests),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SearchMatrixResponse value) {
    final total_length =
        FfiConverterSequencePointId.allocationSize(value.sampleIds) +
        FfiConverterSequenceSequenceScoredPoint.allocationSize(value.nearests) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SearchMatrixResponse value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequencePointId.write(
      value.sampleIds,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceSequenceScoredPoint.write(
      value.nearests,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SearchMatrixResponse value) {
    return FfiConverterSequencePointId.allocationSize(value.sampleIds) +
        FfiConverterSequenceSequenceScoredPoint.allocationSize(value.nearests) +
        0;
  }
}

class ContextPair {
  final NamedVector positive;
  final NamedVector negative;
  ContextPair({required this.positive, required this.negative});
}

class FfiConverterContextPair {
  static ContextPair lift(RustBuffer buf) {
    return FfiConverterContextPair.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ContextPair> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final positive_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final positive = positive_lifted.value;
    new_offset += positive_lifted.bytesRead;
    final negative_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final negative = negative_lifted.value;
    new_offset += negative_lifted.bytesRead;
    return LiftRetVal(
      ContextPair(positive: positive, negative: negative),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ContextPair value) {
    final total_length =
        FfiConverterNamedVector.allocationSize(value.positive) +
        FfiConverterNamedVector.allocationSize(value.negative) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ContextPair value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterNamedVector.write(
      value.positive,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterNamedVector.write(
      value.negative,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ContextPair value) {
    return FfiConverterNamedVector.allocationSize(value.positive) +
        FfiConverterNamedVector.allocationSize(value.negative) +
        0;
  }
}

class FeedbackCoefficients {
  final double a;
  final double b;
  final double c;
  FeedbackCoefficients({required this.a, required this.b, required this.c});
}

class FfiConverterFeedbackCoefficients {
  static FeedbackCoefficients lift(RustBuffer buf) {
    return FfiConverterFeedbackCoefficients.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FeedbackCoefficients> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final a_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final a = a_lifted.value;
    new_offset += a_lifted.bytesRead;
    final b_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final b = b_lifted.value;
    new_offset += b_lifted.bytesRead;
    final c_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final c = c_lifted.value;
    new_offset += c_lifted.bytesRead;
    return LiftRetVal(
      FeedbackCoefficients(a: a, b: b, c: c),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FeedbackCoefficients value) {
    final total_length =
        FfiConverterDouble32.allocationSize(value.a) +
        FfiConverterDouble32.allocationSize(value.b) +
        FfiConverterDouble32.allocationSize(value.c) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FeedbackCoefficients value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterDouble32.write(
      value.a,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble32.write(
      value.b,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble32.write(
      value.c,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FeedbackCoefficients value) {
    return FfiConverterDouble32.allocationSize(value.a) +
        FfiConverterDouble32.allocationSize(value.b) +
        FfiConverterDouble32.allocationSize(value.c) +
        0;
  }
}

class FeedbackItem {
  final NamedVector vector;
  final double score;
  FeedbackItem({required this.vector, required this.score});
}

class FfiConverterFeedbackItem {
  static FeedbackItem lift(RustBuffer buf) {
    return FfiConverterFeedbackItem.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FeedbackItem> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vector_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final score_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final score = score_lifted.value;
    new_offset += score_lifted.bytesRead;
    return LiftRetVal(
      FeedbackItem(vector: vector, score: score),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FeedbackItem value) {
    final total_length =
        FfiConverterNamedVector.allocationSize(value.vector) +
        FfiConverterDouble32.allocationSize(value.score) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FeedbackItem value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterNamedVector.write(
      value.vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble32.write(
      value.score,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FeedbackItem value) {
    return FfiConverterNamedVector.allocationSize(value.vector) +
        FfiConverterDouble32.allocationSize(value.score) +
        0;
  }
}

class OrderBy {
  final String key;
  final Direction? direction;
  final StartFrom? startFrom;
  OrderBy({required this.key, this.direction = null, this.startFrom = null});
}

class FfiConverterOrderBy {
  static OrderBy lift(RustBuffer buf) {
    return FfiConverterOrderBy.read(buf.asUint8List()).value;
  }

  static LiftRetVal<OrderBy> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    final direction_lifted = FfiConverterOptionalDirection.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final direction = direction_lifted.value;
    new_offset += direction_lifted.bytesRead;
    final startFrom_lifted = FfiConverterOptionalStartFrom.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final startFrom = startFrom_lifted.value;
    new_offset += startFrom_lifted.bytesRead;
    return LiftRetVal(
      OrderBy(key: key, direction: direction, startFrom: startFrom),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(OrderBy value) {
    final total_length =
        FfiConverterString.allocationSize(value.key) +
        FfiConverterOptionalDirection.allocationSize(value.direction) +
        FfiConverterOptionalStartFrom.allocationSize(value.startFrom) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(OrderBy value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterString.write(
      value.key,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDirection.write(
      value.direction,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalStartFrom.write(
      value.startFrom,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(OrderBy value) {
    return FfiConverterString.allocationSize(value.key) +
        FfiConverterOptionalDirection.allocationSize(value.direction) +
        FfiConverterOptionalStartFrom.allocationSize(value.startFrom) +
        0;
  }
}

class Prefetch {
  final int limit;
  final ScoringQuery? query;
  final List<Prefetch> prefetches;
  final Filter? filter;
  final double? scoreThreshold;
  final SearchParams? params;
  Prefetch({
    required this.limit,
    this.query = null,
    this.prefetches = const [],
    this.filter = null,
    this.scoreThreshold = null,
    this.params = null,
  });
}

class FfiConverterPrefetch {
  static Prefetch lift(RustBuffer buf) {
    return FfiConverterPrefetch.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Prefetch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final limit_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limit = limit_lifted.value;
    new_offset += limit_lifted.bytesRead;
    final query_lifted = FfiConverterOptionalScoringQuery.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final query = query_lifted.value;
    new_offset += query_lifted.bytesRead;
    final prefetches_lifted = FfiConverterSequencePrefetch.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final prefetches = prefetches_lifted.value;
    new_offset += prefetches_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final scoreThreshold_lifted = FfiConverterOptionalDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final scoreThreshold = scoreThreshold_lifted.value;
    new_offset += scoreThreshold_lifted.bytesRead;
    final params_lifted = FfiConverterOptionalSearchParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final params = params_lifted.value;
    new_offset += params_lifted.bytesRead;
    return LiftRetVal(
      Prefetch(
        limit: limit,
        query: query,
        prefetches: prefetches,
        filter: filter,
        scoreThreshold: scoreThreshold,
        params: params,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Prefetch value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalScoringQuery.allocationSize(value.query) +
        FfiConverterSequencePrefetch.allocationSize(value.prefetches) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Prefetch value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.limit,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalScoringQuery.write(
      value.query,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequencePrefetch.write(
      value.prefetches,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble32.write(
      value.scoreThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSearchParams.write(
      value.params,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Prefetch value) {
    return FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalScoringQuery.allocationSize(value.query) +
        FfiConverterSequencePrefetch.allocationSize(value.prefetches) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        0;
  }
}

class QueryRequest {
  final int limit;
  final int? offset;
  final ScoringQuery? query;
  final List<Prefetch> prefetches;
  final WithVector? withVector;
  final WithPayload? withPayload;
  final Filter? filter;
  final double? scoreThreshold;
  final SearchParams? params;
  QueryRequest({
    required this.limit,
    this.offset = null,
    this.query = null,
    this.prefetches = const [],
    this.withVector = null,
    this.withPayload = null,
    this.filter = null,
    this.scoreThreshold = null,
    this.params = null,
  });
}

class FfiConverterQueryRequest {
  static QueryRequest lift(RustBuffer buf) {
    return FfiConverterQueryRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<QueryRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final limit_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limit = limit_lifted.value;
    new_offset += limit_lifted.bytesRead;
    final offset_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final offset = offset_lifted.value;
    new_offset += offset_lifted.bytesRead;
    final query_lifted = FfiConverterOptionalScoringQuery.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final query = query_lifted.value;
    new_offset += query_lifted.bytesRead;
    final prefetches_lifted = FfiConverterSequencePrefetch.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final prefetches = prefetches_lifted.value;
    new_offset += prefetches_lifted.bytesRead;
    final withVector_lifted = FfiConverterOptionalWithVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withVector = withVector_lifted.value;
    new_offset += withVector_lifted.bytesRead;
    final withPayload_lifted = FfiConverterOptionalWithPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withPayload = withPayload_lifted.value;
    new_offset += withPayload_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final scoreThreshold_lifted = FfiConverterOptionalDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final scoreThreshold = scoreThreshold_lifted.value;
    new_offset += scoreThreshold_lifted.bytesRead;
    final params_lifted = FfiConverterOptionalSearchParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final params = params_lifted.value;
    new_offset += params_lifted.bytesRead;
    return LiftRetVal(
      QueryRequest(
        limit: limit,
        offset: offset,
        query: query,
        prefetches: prefetches,
        withVector: withVector,
        withPayload: withPayload,
        filter: filter,
        scoreThreshold: scoreThreshold,
        params: params,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(QueryRequest value) {
    final total_length =
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalUInt64.allocationSize(value.offset) +
        FfiConverterOptionalScoringQuery.allocationSize(value.query) +
        FfiConverterSequencePrefetch.allocationSize(value.prefetches) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(QueryRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterUInt64.write(
      value.limit,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.offset,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalScoringQuery.write(
      value.query,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequencePrefetch.write(
      value.prefetches,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithVector.write(
      value.withVector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithPayload.write(
      value.withPayload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble32.write(
      value.scoreThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSearchParams.write(
      value.params,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(QueryRequest value) {
    return FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalUInt64.allocationSize(value.offset) +
        FfiConverterOptionalScoringQuery.allocationSize(value.query) +
        FfiConverterSequencePrefetch.allocationSize(value.prefetches) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        0;
  }
}

class SearchParams {
  final int? hnswEf;
  final bool exact;
  final bool indexedOnly;
  SearchParams({
    this.hnswEf = null,
    this.exact = false,
    this.indexedOnly = false,
  });
}

class FfiConverterSearchParams {
  static SearchParams lift(RustBuffer buf) {
    return FfiConverterSearchParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SearchParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final hnswEf_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final hnswEf = hnswEf_lifted.value;
    new_offset += hnswEf_lifted.bytesRead;
    final exact_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final exact = exact_lifted.value;
    new_offset += exact_lifted.bytesRead;
    final indexedOnly_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final indexedOnly = indexedOnly_lifted.value;
    new_offset += indexedOnly_lifted.bytesRead;
    return LiftRetVal(
      SearchParams(hnswEf: hnswEf, exact: exact, indexedOnly: indexedOnly),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SearchParams value) {
    final total_length =
        FfiConverterOptionalUInt64.allocationSize(value.hnswEf) +
        FfiConverterBool.allocationSize(value.exact) +
        FfiConverterBool.allocationSize(value.indexedOnly) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SearchParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalUInt64.write(
      value.hnswEf,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterBool.write(
      value.exact,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterBool.write(
      value.indexedOnly,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SearchParams value) {
    return FfiConverterOptionalUInt64.allocationSize(value.hnswEf) +
        FfiConverterBool.allocationSize(value.exact) +
        FfiConverterBool.allocationSize(value.indexedOnly) +
        0;
  }
}

class RetrieveRequest {
  final List<PointId> pointIds;
  final WithPayload? withPayload;
  final WithVector? withVector;
  RetrieveRequest({
    required this.pointIds,
    this.withPayload = null,
    this.withVector = null,
  });
}

class FfiConverterRetrieveRequest {
  static RetrieveRequest lift(RustBuffer buf) {
    return FfiConverterRetrieveRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RetrieveRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final pointIds_lifted = FfiConverterSequencePointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final pointIds = pointIds_lifted.value;
    new_offset += pointIds_lifted.bytesRead;
    final withPayload_lifted = FfiConverterOptionalWithPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withPayload = withPayload_lifted.value;
    new_offset += withPayload_lifted.bytesRead;
    final withVector_lifted = FfiConverterOptionalWithVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withVector = withVector_lifted.value;
    new_offset += withVector_lifted.bytesRead;
    return LiftRetVal(
      RetrieveRequest(
        pointIds: pointIds,
        withPayload: withPayload,
        withVector: withVector,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(RetrieveRequest value) {
    final total_length =
        FfiConverterSequencePointId.allocationSize(value.pointIds) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(RetrieveRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequencePointId.write(
      value.pointIds,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithPayload.write(
      value.withPayload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithVector.write(
      value.withVector,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(RetrieveRequest value) {
    return FfiConverterSequencePointId.allocationSize(value.pointIds) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        0;
  }
}

class ScrollRequest {
  final PointId? offset;
  final int? limit;
  final Filter? filter;
  final WithPayload? withPayload;
  final WithVector? withVector;
  final OrderBy? orderBy;
  ScrollRequest({
    this.offset = null,
    this.limit = null,
    this.filter = null,
    this.withPayload = null,
    this.withVector = null,
    this.orderBy = null,
  });
}

class FfiConverterScrollRequest {
  static ScrollRequest lift(RustBuffer buf) {
    return FfiConverterScrollRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ScrollRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final offset_lifted = FfiConverterOptionalPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final offset = offset_lifted.value;
    new_offset += offset_lifted.bytesRead;
    final limit_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limit = limit_lifted.value;
    new_offset += limit_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final withPayload_lifted = FfiConverterOptionalWithPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withPayload = withPayload_lifted.value;
    new_offset += withPayload_lifted.bytesRead;
    final withVector_lifted = FfiConverterOptionalWithVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withVector = withVector_lifted.value;
    new_offset += withVector_lifted.bytesRead;
    final orderBy_lifted = FfiConverterOptionalOrderBy.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final orderBy = orderBy_lifted.value;
    new_offset += orderBy_lifted.bytesRead;
    return LiftRetVal(
      ScrollRequest(
        offset: offset,
        limit: limit,
        filter: filter,
        withPayload: withPayload,
        withVector: withVector,
        orderBy: orderBy,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ScrollRequest value) {
    final total_length =
        FfiConverterOptionalPointId.allocationSize(value.offset) +
        FfiConverterOptionalUInt64.allocationSize(value.limit) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalOrderBy.allocationSize(value.orderBy) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ScrollRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalPointId.write(
      value.offset,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.limit,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithPayload.write(
      value.withPayload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithVector.write(
      value.withVector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalOrderBy.write(
      value.orderBy,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ScrollRequest value) {
    return FfiConverterOptionalPointId.allocationSize(value.offset) +
        FfiConverterOptionalUInt64.allocationSize(value.limit) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalOrderBy.allocationSize(value.orderBy) +
        0;
  }
}

class ScrollResponse {
  final List<Record> records;
  final PointId? nextOffset;
  ScrollResponse({required this.records, this.nextOffset = null});
}

class FfiConverterScrollResponse {
  static ScrollResponse lift(RustBuffer buf) {
    return FfiConverterScrollResponse.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ScrollResponse> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final records_lifted = FfiConverterSequenceRecord.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final records = records_lifted.value;
    new_offset += records_lifted.bytesRead;
    final nextOffset_lifted = FfiConverterOptionalPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final nextOffset = nextOffset_lifted.value;
    new_offset += nextOffset_lifted.bytesRead;
    return LiftRetVal(
      ScrollResponse(records: records, nextOffset: nextOffset),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ScrollResponse value) {
    final total_length =
        FfiConverterSequenceRecord.allocationSize(value.records) +
        FfiConverterOptionalPointId.allocationSize(value.nextOffset) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ScrollResponse value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequenceRecord.write(
      value.records,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalPointId.write(
      value.nextOffset,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ScrollResponse value) {
    return FfiConverterSequenceRecord.allocationSize(value.records) +
        FfiConverterOptionalPointId.allocationSize(value.nextOffset) +
        0;
  }
}

class SearchRequest {
  final Query query;
  final int limit;
  final int? offset;
  final Filter? filter;
  final SearchParams? params;
  final WithVector? withVector;
  final WithPayload? withPayload;
  final double? scoreThreshold;
  SearchRequest({
    required this.query,
    required this.limit,
    this.offset = null,
    this.filter = null,
    this.params = null,
    this.withVector = null,
    this.withPayload = null,
    this.scoreThreshold = null,
  });
}

class FfiConverterSearchRequest {
  static SearchRequest lift(RustBuffer buf) {
    return FfiConverterSearchRequest.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SearchRequest> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final query_lifted = FfiConverterQuery.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final query = query_lifted.value;
    new_offset += query_lifted.bytesRead;
    final limit_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final limit = limit_lifted.value;
    new_offset += limit_lifted.bytesRead;
    final offset_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final offset = offset_lifted.value;
    new_offset += offset_lifted.bytesRead;
    final filter_lifted = FfiConverterOptionalFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    final params_lifted = FfiConverterOptionalSearchParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final params = params_lifted.value;
    new_offset += params_lifted.bytesRead;
    final withVector_lifted = FfiConverterOptionalWithVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withVector = withVector_lifted.value;
    new_offset += withVector_lifted.bytesRead;
    final withPayload_lifted = FfiConverterOptionalWithPayload.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final withPayload = withPayload_lifted.value;
    new_offset += withPayload_lifted.bytesRead;
    final scoreThreshold_lifted = FfiConverterOptionalDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final scoreThreshold = scoreThreshold_lifted.value;
    new_offset += scoreThreshold_lifted.bytesRead;
    return LiftRetVal(
      SearchRequest(
        query: query,
        limit: limit,
        offset: offset,
        filter: filter,
        params: params,
        withVector: withVector,
        withPayload: withPayload,
        scoreThreshold: scoreThreshold,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SearchRequest value) {
    final total_length =
        FfiConverterQuery.allocationSize(value.query) +
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalUInt64.allocationSize(value.offset) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SearchRequest value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterQuery.write(
      value.query,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.limit,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.offset,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalFilter.write(
      value.filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSearchParams.write(
      value.params,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithVector.write(
      value.withVector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalWithPayload.write(
      value.withPayload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalDouble32.write(
      value.scoreThreshold,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SearchRequest value) {
    return FfiConverterQuery.allocationSize(value.query) +
        FfiConverterUInt64.allocationSize(value.limit) +
        FfiConverterOptionalUInt64.allocationSize(value.offset) +
        FfiConverterOptionalFilter.allocationSize(value.filter) +
        FfiConverterOptionalSearchParams.allocationSize(value.params) +
        FfiConverterOptionalWithVector.allocationSize(value.withVector) +
        FfiConverterOptionalWithPayload.allocationSize(value.withPayload) +
        FfiConverterOptionalDouble32.allocationSize(value.scoreThreshold) +
        0;
  }
}

class BoolIndexParams {
  final Memory? memory;
  final bool? enableHnsw;
  BoolIndexParams({this.memory = null, this.enableHnsw = null});
}

class FfiConverterBoolIndexParams {
  static BoolIndexParams lift(RustBuffer buf) {
    return FfiConverterBoolIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<BoolIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      BoolIndexParams(memory: memory, enableHnsw: enableHnsw),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(BoolIndexParams value) {
    final total_length =
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(BoolIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(BoolIndexParams value) {
    return FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class DatetimeIndexParams {
  final bool? isPrincipal;
  final Memory? memory;
  final bool? enableHnsw;
  DatetimeIndexParams({
    this.isPrincipal = null,
    this.memory = null,
    this.enableHnsw = null,
  });
}

class FfiConverterDatetimeIndexParams {
  static DatetimeIndexParams lift(RustBuffer buf) {
    return FfiConverterDatetimeIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<DatetimeIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final isPrincipal_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final isPrincipal = isPrincipal_lifted.value;
    new_offset += isPrincipal_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      DatetimeIndexParams(
        isPrincipal: isPrincipal,
        memory: memory,
        enableHnsw: enableHnsw,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(DatetimeIndexParams value) {
    final total_length =
        FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(DatetimeIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalBool.write(
      value.isPrincipal,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(DatetimeIndexParams value) {
    return FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class FloatIndexParams {
  final bool? isPrincipal;
  final Memory? memory;
  final bool? enableHnsw;
  FloatIndexParams({
    this.isPrincipal = null,
    this.memory = null,
    this.enableHnsw = null,
  });
}

class FfiConverterFloatIndexParams {
  static FloatIndexParams lift(RustBuffer buf) {
    return FfiConverterFloatIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<FloatIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final isPrincipal_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final isPrincipal = isPrincipal_lifted.value;
    new_offset += isPrincipal_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      FloatIndexParams(
        isPrincipal: isPrincipal,
        memory: memory,
        enableHnsw: enableHnsw,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(FloatIndexParams value) {
    final total_length =
        FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(FloatIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalBool.write(
      value.isPrincipal,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(FloatIndexParams value) {
    return FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class GeoIndexParams {
  final Memory? memory;
  final bool? enableHnsw;
  GeoIndexParams({this.memory = null, this.enableHnsw = null});
}

class FfiConverterGeoIndexParams {
  static GeoIndexParams lift(RustBuffer buf) {
    return FfiConverterGeoIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      GeoIndexParams(memory: memory, enableHnsw: enableHnsw),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(GeoIndexParams value) {
    final total_length =
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(GeoIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(GeoIndexParams value) {
    return FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class IntegerIndexParams {
  final bool? lookup;
  final bool? range;
  final bool? isPrincipal;
  final Memory? memory;
  final bool? enableHnsw;
  IntegerIndexParams({
    this.lookup = null,
    this.range = null,
    this.isPrincipal = null,
    this.memory = null,
    this.enableHnsw = null,
  });
}

class FfiConverterIntegerIndexParams {
  static IntegerIndexParams lift(RustBuffer buf) {
    return FfiConverterIntegerIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<IntegerIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final lookup_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lookup = lookup_lifted.value;
    new_offset += lookup_lifted.bytesRead;
    final range_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final range = range_lifted.value;
    new_offset += range_lifted.bytesRead;
    final isPrincipal_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final isPrincipal = isPrincipal_lifted.value;
    new_offset += isPrincipal_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      IntegerIndexParams(
        lookup: lookup,
        range: range,
        isPrincipal: isPrincipal,
        memory: memory,
        enableHnsw: enableHnsw,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(IntegerIndexParams value) {
    final total_length =
        FfiConverterOptionalBool.allocationSize(value.lookup) +
        FfiConverterOptionalBool.allocationSize(value.range) +
        FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(IntegerIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalBool.write(
      value.lookup,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.range,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.isPrincipal,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(IntegerIndexParams value) {
    return FfiConverterOptionalBool.allocationSize(value.lookup) +
        FfiConverterOptionalBool.allocationSize(value.range) +
        FfiConverterOptionalBool.allocationSize(value.isPrincipal) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class KeywordIndexParams {
  final bool? isTenant;
  final Memory? memory;
  final bool? enableHnsw;
  final bool? prefix;
  KeywordIndexParams({
    this.isTenant = null,
    this.memory = null,
    this.enableHnsw = null,
    this.prefix = null,
  });
}

class FfiConverterKeywordIndexParams {
  static KeywordIndexParams lift(RustBuffer buf) {
    return FfiConverterKeywordIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<KeywordIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final isTenant_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final isTenant = isTenant_lifted.value;
    new_offset += isTenant_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    final prefix_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final prefix = prefix_lifted.value;
    new_offset += prefix_lifted.bytesRead;
    return LiftRetVal(
      KeywordIndexParams(
        isTenant: isTenant,
        memory: memory,
        enableHnsw: enableHnsw,
        prefix: prefix,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(KeywordIndexParams value) {
    final total_length =
        FfiConverterOptionalBool.allocationSize(value.isTenant) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        FfiConverterOptionalBool.allocationSize(value.prefix) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(KeywordIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalBool.write(
      value.isTenant,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.prefix,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(KeywordIndexParams value) {
    return FfiConverterOptionalBool.allocationSize(value.isTenant) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        FfiConverterOptionalBool.allocationSize(value.prefix) +
        0;
  }
}

class PayloadIndexInfo {
  final PayloadSchemaType dataType;
  final PayloadIndexParams? params;
  final int points;
  PayloadIndexInfo({
    required this.dataType,
    this.params = null,
    required this.points,
  });
}

class FfiConverterPayloadIndexInfo {
  static PayloadIndexInfo lift(RustBuffer buf) {
    return FfiConverterPayloadIndexInfo.read(buf.asUint8List()).value;
  }

  static LiftRetVal<PayloadIndexInfo> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final dataType_lifted = FfiConverterPayloadSchemaType.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final dataType = dataType_lifted.value;
    new_offset += dataType_lifted.bytesRead;
    final params_lifted = FfiConverterOptionalPayloadIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final params = params_lifted.value;
    new_offset += params_lifted.bytesRead;
    final points_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final points = points_lifted.value;
    new_offset += points_lifted.bytesRead;
    return LiftRetVal(
      PayloadIndexInfo(dataType: dataType, params: params, points: points),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(PayloadIndexInfo value) {
    final total_length =
        FfiConverterPayloadSchemaType.allocationSize(value.dataType) +
        FfiConverterOptionalPayloadIndexParams.allocationSize(value.params) +
        FfiConverterUInt64.allocationSize(value.points) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(PayloadIndexInfo value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterPayloadSchemaType.write(
      value.dataType,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalPayloadIndexParams.write(
      value.params,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.points,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(PayloadIndexInfo value) {
    return FfiConverterPayloadSchemaType.allocationSize(value.dataType) +
        FfiConverterOptionalPayloadIndexParams.allocationSize(value.params) +
        FfiConverterUInt64.allocationSize(value.points) +
        0;
  }
}

class TextIndexParams {
  final TokenizerType? tokenizer;
  final int? minTokenLen;
  final int? maxTokenLen;
  final bool? lowercase;
  final bool? asciiFolding;
  final bool? phraseMatching;
  final Stopwords? stopwords;
  final Memory? memory;
  final Stemmer? stemmer;
  final bool? enableHnsw;
  TextIndexParams({
    this.tokenizer = null,
    this.minTokenLen = null,
    this.maxTokenLen = null,
    this.lowercase = null,
    this.asciiFolding = null,
    this.phraseMatching = null,
    this.stopwords = null,
    this.memory = null,
    this.stemmer = null,
    this.enableHnsw = null,
  });
}

class FfiConverterTextIndexParams {
  static TextIndexParams lift(RustBuffer buf) {
    return FfiConverterTextIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TextIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final tokenizer_lifted = FfiConverterOptionalTokenizerType.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final tokenizer = tokenizer_lifted.value;
    new_offset += tokenizer_lifted.bytesRead;
    final minTokenLen_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final minTokenLen = minTokenLen_lifted.value;
    new_offset += minTokenLen_lifted.bytesRead;
    final maxTokenLen_lifted = FfiConverterOptionalUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final maxTokenLen = maxTokenLen_lifted.value;
    new_offset += maxTokenLen_lifted.bytesRead;
    final lowercase_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lowercase = lowercase_lifted.value;
    new_offset += lowercase_lifted.bytesRead;
    final asciiFolding_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final asciiFolding = asciiFolding_lifted.value;
    new_offset += asciiFolding_lifted.bytesRead;
    final phraseMatching_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final phraseMatching = phraseMatching_lifted.value;
    new_offset += phraseMatching_lifted.bytesRead;
    final stopwords_lifted = FfiConverterOptionalStopwords.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final stopwords = stopwords_lifted.value;
    new_offset += stopwords_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final stemmer_lifted = FfiConverterOptionalStemmer.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final stemmer = stemmer_lifted.value;
    new_offset += stemmer_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      TextIndexParams(
        tokenizer: tokenizer,
        minTokenLen: minTokenLen,
        maxTokenLen: maxTokenLen,
        lowercase: lowercase,
        asciiFolding: asciiFolding,
        phraseMatching: phraseMatching,
        stopwords: stopwords,
        memory: memory,
        stemmer: stemmer,
        enableHnsw: enableHnsw,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(TextIndexParams value) {
    final total_length =
        FfiConverterOptionalTokenizerType.allocationSize(value.tokenizer) +
        FfiConverterOptionalUInt64.allocationSize(value.minTokenLen) +
        FfiConverterOptionalUInt64.allocationSize(value.maxTokenLen) +
        FfiConverterOptionalBool.allocationSize(value.lowercase) +
        FfiConverterOptionalBool.allocationSize(value.asciiFolding) +
        FfiConverterOptionalBool.allocationSize(value.phraseMatching) +
        FfiConverterOptionalStopwords.allocationSize(value.stopwords) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalStemmer.allocationSize(value.stemmer) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(TextIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalTokenizerType.write(
      value.tokenizer,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.minTokenLen,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalUInt64.write(
      value.maxTokenLen,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.lowercase,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.asciiFolding,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.phraseMatching,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalStopwords.write(
      value.stopwords,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalStemmer.write(
      value.stemmer,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(TextIndexParams value) {
    return FfiConverterOptionalTokenizerType.allocationSize(value.tokenizer) +
        FfiConverterOptionalUInt64.allocationSize(value.minTokenLen) +
        FfiConverterOptionalUInt64.allocationSize(value.maxTokenLen) +
        FfiConverterOptionalBool.allocationSize(value.lowercase) +
        FfiConverterOptionalBool.allocationSize(value.asciiFolding) +
        FfiConverterOptionalBool.allocationSize(value.phraseMatching) +
        FfiConverterOptionalStopwords.allocationSize(value.stopwords) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalStemmer.allocationSize(value.stemmer) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class UuidIndexParams {
  final bool? isTenant;
  final Memory? memory;
  final bool? enableHnsw;
  UuidIndexParams({
    this.isTenant = null,
    this.memory = null,
    this.enableHnsw = null,
  });
}

class FfiConverterUuidIndexParams {
  static UuidIndexParams lift(RustBuffer buf) {
    return FfiConverterUuidIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<UuidIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final isTenant_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final isTenant = isTenant_lifted.value;
    new_offset += isTenant_lifted.bytesRead;
    final memory_lifted = FfiConverterOptionalMemory.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final memory = memory_lifted.value;
    new_offset += memory_lifted.bytesRead;
    final enableHnsw_lifted = FfiConverterOptionalBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enableHnsw = enableHnsw_lifted.value;
    new_offset += enableHnsw_lifted.bytesRead;
    return LiftRetVal(
      UuidIndexParams(
        isTenant: isTenant,
        memory: memory,
        enableHnsw: enableHnsw,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(UuidIndexParams value) {
    final total_length =
        FfiConverterOptionalBool.allocationSize(value.isTenant) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(UuidIndexParams value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterOptionalBool.write(
      value.isTenant,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalMemory.write(
      value.memory,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalBool.write(
      value.enableHnsw,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(UuidIndexParams value) {
    return FfiConverterOptionalBool.allocationSize(value.isTenant) +
        FfiConverterOptionalMemory.allocationSize(value.memory) +
        FfiConverterOptionalBool.allocationSize(value.enableHnsw) +
        0;
  }
}

class Point {
  final PointId id;
  final Vector vector;
  final String? payload;
  Point({required this.id, required this.vector, this.payload = null});
}

class FfiConverterPoint {
  static Point lift(RustBuffer buf) {
    return FfiConverterPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Point> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final id_lifted = FfiConverterPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final id = id_lifted.value;
    new_offset += id_lifted.bytesRead;
    final vector_lifted = FfiConverterVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final payload_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final payload = payload_lifted.value;
    new_offset += payload_lifted.bytesRead;
    return LiftRetVal(
      Point(id: id, vector: vector, payload: payload),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Point value) {
    final total_length =
        FfiConverterPointId.allocationSize(value.id) +
        FfiConverterVector.allocationSize(value.vector) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Point value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterPointId.write(
      value.id,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterVector.write(
      value.vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.payload,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Point value) {
    return FfiConverterPointId.allocationSize(value.id) +
        FfiConverterVector.allocationSize(value.vector) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        0;
  }
}

class PointVectors {
  final PointId id;
  final Vector vector;
  PointVectors({required this.id, required this.vector});
}

class FfiConverterPointVectors {
  static PointVectors lift(RustBuffer buf) {
    return FfiConverterPointVectors.read(buf.asUint8List()).value;
  }

  static LiftRetVal<PointVectors> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final id_lifted = FfiConverterPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final id = id_lifted.value;
    new_offset += id_lifted.bytesRead;
    final vector_lifted = FfiConverterVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    return LiftRetVal(
      PointVectors(id: id, vector: vector),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(PointVectors value) {
    final total_length =
        FfiConverterPointId.allocationSize(value.id) +
        FfiConverterVector.allocationSize(value.vector) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(PointVectors value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterPointId.write(
      value.id,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterVector.write(
      value.vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(PointVectors value) {
    return FfiConverterPointId.allocationSize(value.id) +
        FfiConverterVector.allocationSize(value.vector) +
        0;
  }
}

class Record {
  final PointId id;
  final String? payload;
  final String? vector;
  final OrderValue? orderValue;
  Record({
    required this.id,
    this.payload = null,
    this.vector = null,
    this.orderValue = null,
  });
}

class FfiConverterRecord {
  static Record lift(RustBuffer buf) {
    return FfiConverterRecord.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Record> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final id_lifted = FfiConverterPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final id = id_lifted.value;
    new_offset += id_lifted.bytesRead;
    final payload_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final payload = payload_lifted.value;
    new_offset += payload_lifted.bytesRead;
    final vector_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final orderValue_lifted = FfiConverterOptionalOrderValue.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final orderValue = orderValue_lifted.value;
    new_offset += orderValue_lifted.bytesRead;
    return LiftRetVal(
      Record(id: id, payload: payload, vector: vector, orderValue: orderValue),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(Record value) {
    final total_length =
        FfiConverterPointId.allocationSize(value.id) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        FfiConverterOptionalString.allocationSize(value.vector) +
        FfiConverterOptionalOrderValue.allocationSize(value.orderValue) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(Record value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterPointId.write(
      value.id,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.payload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalOrderValue.write(
      value.orderValue,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(Record value) {
    return FfiConverterPointId.allocationSize(value.id) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        FfiConverterOptionalString.allocationSize(value.vector) +
        FfiConverterOptionalOrderValue.allocationSize(value.orderValue) +
        0;
  }
}

class ScoredPoint {
  final PointId id;
  final int version;
  final double score;
  final String? payload;
  final String? vector;
  final OrderValue? orderValue;
  ScoredPoint({
    required this.id,
    required this.version,
    required this.score,
    this.payload = null,
    this.vector = null,
    this.orderValue = null,
  });
}

class FfiConverterScoredPoint {
  static ScoredPoint lift(RustBuffer buf) {
    return FfiConverterScoredPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ScoredPoint> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final id_lifted = FfiConverterPointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final id = id_lifted.value;
    new_offset += id_lifted.bytesRead;
    final version_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final version = version_lifted.value;
    new_offset += version_lifted.bytesRead;
    final score_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final score = score_lifted.value;
    new_offset += score_lifted.bytesRead;
    final payload_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final payload = payload_lifted.value;
    new_offset += payload_lifted.bytesRead;
    final vector_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final orderValue_lifted = FfiConverterOptionalOrderValue.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final orderValue = orderValue_lifted.value;
    new_offset += orderValue_lifted.bytesRead;
    return LiftRetVal(
      ScoredPoint(
        id: id,
        version: version,
        score: score,
        payload: payload,
        vector: vector,
        orderValue: orderValue,
      ),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(ScoredPoint value) {
    final total_length =
        FfiConverterPointId.allocationSize(value.id) +
        FfiConverterUInt64.allocationSize(value.version) +
        FfiConverterDouble32.allocationSize(value.score) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        FfiConverterOptionalString.allocationSize(value.vector) +
        FfiConverterOptionalOrderValue.allocationSize(value.orderValue) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(ScoredPoint value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterPointId.write(
      value.id,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      value.version,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble32.write(
      value.score,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.payload,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      value.vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalOrderValue.write(
      value.orderValue,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(ScoredPoint value) {
    return FfiConverterPointId.allocationSize(value.id) +
        FfiConverterUInt64.allocationSize(value.version) +
        FfiConverterDouble32.allocationSize(value.score) +
        FfiConverterOptionalString.allocationSize(value.payload) +
        FfiConverterOptionalString.allocationSize(value.vector) +
        FfiConverterOptionalOrderValue.allocationSize(value.orderValue) +
        0;
  }
}

class SparseVector {
  final List<int> indices;
  final List<double> values;
  SparseVector({required this.indices, required this.values});
}

class FfiConverterSparseVector {
  static SparseVector lift(RustBuffer buf) {
    return FfiConverterSparseVector.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SparseVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final indices_lifted = FfiConverterSequenceUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final indices = indices_lifted.value;
    new_offset += indices_lifted.bytesRead;
    final values_lifted = FfiConverterSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final values = values_lifted.value;
    new_offset += values_lifted.bytesRead;
    return LiftRetVal(
      SparseVector(indices: indices, values: values),
      new_offset - buf.offsetInBytes,
    );
  }

  static RustBuffer lower(SparseVector value) {
    final total_length =
        FfiConverterSequenceUInt32.allocationSize(value.indices) +
        FfiConverterSequenceDouble32.allocationSize(value.values) +
        0;
    final buf = Uint8List(total_length);
    write(value, buf);
    return toRustBuffer(buf);
  }

  static int write(SparseVector value, Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    new_offset += FfiConverterSequenceUInt32.write(
      value.indices,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceDouble32.write(
      value.values,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset - buf.offsetInBytes;
  }

  static int allocationSize(SparseVector value) {
    return FfiConverterSequenceUInt32.allocationSize(value.indices) +
        FfiConverterSequenceDouble32.allocationSize(value.values) +
        0;
  }
}

enum BinaryQuantizationEncoding { oneBit, twoBits, oneAndHalfBits }

class FfiConverterBinaryQuantizationEncoding {
  static LiftRetVal<BinaryQuantizationEncoding> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(BinaryQuantizationEncoding.oneBit, 4);
      case 2:
        return LiftRetVal(BinaryQuantizationEncoding.twoBits, 4);
      case 3:
        return LiftRetVal(BinaryQuantizationEncoding.oneAndHalfBits, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static BinaryQuantizationEncoding lift(RustBuffer buffer) {
    return FfiConverterBinaryQuantizationEncoding.read(
      buffer.asUint8List(),
    ).value;
  }

  static RustBuffer lower(BinaryQuantizationEncoding input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(BinaryQuantizationEncoding _value) {
    return 4;
  }

  static int write(BinaryQuantizationEncoding value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum BinaryQuantizationQueryEncoding {
  default_,
  binary,
  scalar4Bits,
  scalar8Bits,
}

class FfiConverterBinaryQuantizationQueryEncoding {
  static LiftRetVal<BinaryQuantizationQueryEncoding> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(BinaryQuantizationQueryEncoding.default_, 4);
      case 2:
        return LiftRetVal(BinaryQuantizationQueryEncoding.binary, 4);
      case 3:
        return LiftRetVal(BinaryQuantizationQueryEncoding.scalar4Bits, 4);
      case 4:
        return LiftRetVal(BinaryQuantizationQueryEncoding.scalar8Bits, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static BinaryQuantizationQueryEncoding lift(RustBuffer buffer) {
    return FfiConverterBinaryQuantizationQueryEncoding.read(
      buffer.asUint8List(),
    ).value;
  }

  static RustBuffer lower(BinaryQuantizationQueryEncoding input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(BinaryQuantizationQueryEncoding _value) {
    return 4;
  }

  static int write(BinaryQuantizationQueryEncoding value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum CompressionRatio { x4, x8, x16, x32, x64 }

class FfiConverterCompressionRatio {
  static LiftRetVal<CompressionRatio> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(CompressionRatio.x4, 4);
      case 2:
        return LiftRetVal(CompressionRatio.x8, 4);
      case 3:
        return LiftRetVal(CompressionRatio.x16, 4);
      case 4:
        return LiftRetVal(CompressionRatio.x32, 4);
      case 5:
        return LiftRetVal(CompressionRatio.x64, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static CompressionRatio lift(RustBuffer buffer) {
    return FfiConverterCompressionRatio.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(CompressionRatio input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(CompressionRatio _value) {
    return 4;
  }

  static int write(CompressionRatio value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum Distance { cosine, euclid, dot, manhattan }

class FfiConverterDistance {
  static LiftRetVal<Distance> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Distance.cosine, 4);
      case 2:
        return LiftRetVal(Distance.euclid, 4);
      case 3:
        return LiftRetVal(Distance.dot, 4);
      case 4:
        return LiftRetVal(Distance.manhattan, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Distance lift(RustBuffer buffer) {
    return FfiConverterDistance.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Distance input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Distance _value) {
    return 4;
  }

  static int write(Distance value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum Memory { cold, cached, pinned }

class FfiConverterMemory {
  static LiftRetVal<Memory> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Memory.cold, 4);
      case 2:
        return LiftRetVal(Memory.cached, 4);
      case 3:
        return LiftRetVal(Memory.pinned, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Memory lift(RustBuffer buffer) {
    return FfiConverterMemory.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Memory input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Memory _value) {
    return 4;
  }

  static int write(Memory value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum Modifier { none, idf }

class FfiConverterModifier {
  static LiftRetVal<Modifier> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Modifier.none, 4);
      case 2:
        return LiftRetVal(Modifier.idf, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Modifier lift(RustBuffer buffer) {
    return FfiConverterModifier.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Modifier input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Modifier _value) {
    return 4;
  }

  static int write(Modifier value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum MultiVectorComparator { maxSim }

class FfiConverterMultiVectorComparator {
  static LiftRetVal<MultiVectorComparator> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(MultiVectorComparator.maxSim, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static MultiVectorComparator lift(RustBuffer buffer) {
    return FfiConverterMultiVectorComparator.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(MultiVectorComparator input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(MultiVectorComparator _value) {
    return 4;
  }

  static int write(MultiVectorComparator value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class QuantizationConfig {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterQuantizationConfig {
  static QuantizationConfig lift(RustBuffer buffer) {
    return FfiConverterQuantizationConfig.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<QuantizationConfig> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ScalarQuantizationConfig.read(subview);
        return LiftRetVal<QuantizationConfig>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = ProductQuantizationConfig.read(subview);
        return LiftRetVal<QuantizationConfig>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = BinaryQuantizationConfig.read(subview);
        return LiftRetVal<QuantizationConfig>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = TurboQuantizationConfig.read(subview);
        return LiftRetVal<QuantizationConfig>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(QuantizationConfig value) {
    return value.lower();
  }

  static int allocationSize(QuantizationConfig value) {
    return value.allocationSize();
  }

  static int write(QuantizationConfig value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ScalarQuantizationConfig extends QuantizationConfig {
  final ScalarQuantizationParams config;
  ScalarQuantizationConfig(ScalarQuantizationParams this.config);
  ScalarQuantizationConfig._(ScalarQuantizationParams this.config);
  static LiftRetVal<ScalarQuantizationConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterScalarQuantizationParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(ScalarQuantizationConfig._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterScalarQuantizationParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterScalarQuantizationParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class ProductQuantizationConfig extends QuantizationConfig {
  final ProductQuantizationParams config;
  ProductQuantizationConfig(ProductQuantizationParams this.config);
  ProductQuantizationConfig._(ProductQuantizationParams this.config);
  static LiftRetVal<ProductQuantizationConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterProductQuantizationParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(ProductQuantizationConfig._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterProductQuantizationParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterProductQuantizationParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class BinaryQuantizationConfig extends QuantizationConfig {
  final BinaryQuantizationParams config;
  BinaryQuantizationConfig(BinaryQuantizationParams this.config);
  BinaryQuantizationConfig._(BinaryQuantizationParams this.config);
  static LiftRetVal<BinaryQuantizationConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterBinaryQuantizationParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(BinaryQuantizationConfig._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterBinaryQuantizationParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterBinaryQuantizationParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class TurboQuantizationConfig extends QuantizationConfig {
  final TurboQuantizationParams config;
  TurboQuantizationConfig(TurboQuantizationParams this.config);
  TurboQuantizationConfig._(TurboQuantizationParams this.config);
  static LiftRetVal<TurboQuantizationConfig> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterTurboQuantizationParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(TurboQuantizationConfig._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterTurboQuantizationParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterTurboQuantizationParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum ScalarType { int8 }

class FfiConverterScalarType {
  static LiftRetVal<ScalarType> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(ScalarType.int8, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static ScalarType lift(RustBuffer buffer) {
    return FfiConverterScalarType.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(ScalarType input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(ScalarType _value) {
    return 4;
  }

  static int write(ScalarType value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum SparseIndexType { mutableRam, immutableRam, mmap }

class FfiConverterSparseIndexType {
  static LiftRetVal<SparseIndexType> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(SparseIndexType.mutableRam, 4);
      case 2:
        return LiftRetVal(SparseIndexType.immutableRam, 4);
      case 3:
        return LiftRetVal(SparseIndexType.mmap, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static SparseIndexType lift(RustBuffer buffer) {
    return FfiConverterSparseIndexType.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(SparseIndexType input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(SparseIndexType _value) {
    return 4;
  }

  static int write(SparseIndexType value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum TurboQuantBitSize { bits1, bits1Point5, bits2, bits4 }

class FfiConverterTurboQuantBitSize {
  static LiftRetVal<TurboQuantBitSize> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(TurboQuantBitSize.bits1, 4);
      case 2:
        return LiftRetVal(TurboQuantBitSize.bits1Point5, 4);
      case 3:
        return LiftRetVal(TurboQuantBitSize.bits2, 4);
      case 4:
        return LiftRetVal(TurboQuantBitSize.bits4, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static TurboQuantBitSize lift(RustBuffer buffer) {
    return FfiConverterTurboQuantBitSize.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(TurboQuantBitSize input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(TurboQuantBitSize _value) {
    return 4;
  }

  static int write(TurboQuantBitSize value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum VectorStorageDatatype { float32, float16, uint8, turbo4 }

class FfiConverterVectorStorageDatatype {
  static LiftRetVal<VectorStorageDatatype> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(VectorStorageDatatype.float32, 4);
      case 2:
        return LiftRetVal(VectorStorageDatatype.float16, 4);
      case 3:
        return LiftRetVal(VectorStorageDatatype.uint8, 4);
      case 4:
        return LiftRetVal(VectorStorageDatatype.turbo4, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static VectorStorageDatatype lift(RustBuffer buffer) {
    return FfiConverterVectorStorageDatatype.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(VectorStorageDatatype input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(VectorStorageDatatype _value) {
    return 4;
  }

  static int write(VectorStorageDatatype value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class EdgeException implements Exception {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterEdgeException {
  static EdgeException lift(RustBuffer buffer) {
    return FfiConverterEdgeException.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<EdgeException> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ShardClosedEdgeException.read(subview);
        return LiftRetVal<EdgeException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = InvalidArgumentEdgeException.read(subview);
        return LiftRetVal<EdgeException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = OperationExceptionEdgeException.read(subview);
        return LiftRetVal<EdgeException>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(EdgeException value) {
    return value.lower();
  }

  static int allocationSize(EdgeException value) {
    return value.allocationSize();
  }

  static int write(EdgeException value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ShardClosedEdgeException extends EdgeException {
  ShardClosedEdgeException();
  ShardClosedEdgeException._();
  static LiftRetVal<ShardClosedEdgeException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    return LiftRetVal(ShardClosedEdgeException._(), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    return new_offset;
  }

  @override
  String toString() {
    return "ShardClosedEdgeException";
  }
}

class InvalidArgumentEdgeException extends EdgeException {
  final String reason;
  InvalidArgumentEdgeException(String this.reason);
  InvalidArgumentEdgeException._(String this.reason);
  static LiftRetVal<InvalidArgumentEdgeException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final reason_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final reason = reason_lifted.value;
    new_offset += reason_lifted.bytesRead;
    return LiftRetVal(InvalidArgumentEdgeException._(reason), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(reason) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      reason,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }

  @override
  String toString() {
    return "InvalidArgumentEdgeException($reason)";
  }
}

class OperationExceptionEdgeException extends EdgeException {
  final String reason;
  OperationExceptionEdgeException(String this.reason);
  OperationExceptionEdgeException._(String this.reason);
  static LiftRetVal<OperationExceptionEdgeException> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final reason_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final reason = reason_lifted.value;
    new_offset += reason_lifted.bytesRead;
    return LiftRetVal(OperationExceptionEdgeException._(reason), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(reason) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      reason,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }

  @override
  String toString() {
    return "OperationExceptionEdgeException($reason)";
  }
}

class EdgeExceptionErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    return FfiConverterEdgeException.lift(errorBuf);
  }
}

final EdgeExceptionErrorHandler edgeExceptionErrorHandler =
    EdgeExceptionErrorHandler();

abstract class AnyVariants {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterAnyVariants {
  static AnyVariants lift(RustBuffer buffer) {
    return FfiConverterAnyVariants.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<AnyVariants> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = StringsAnyVariants.read(subview);
        return LiftRetVal<AnyVariants>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = IntegersAnyVariants.read(subview);
        return LiftRetVal<AnyVariants>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(AnyVariants value) {
    return value.lower();
  }

  static int allocationSize(AnyVariants value) {
    return value.allocationSize();
  }

  static int write(AnyVariants value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class StringsAnyVariants extends AnyVariants {
  final List<String> values;
  StringsAnyVariants(List<String> this.values);
  StringsAnyVariants._(List<String> this.values);
  static LiftRetVal<StringsAnyVariants> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final values_lifted = FfiConverterSequenceString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final values = values_lifted.value;
    new_offset += values_lifted.bytesRead;
    return LiftRetVal(StringsAnyVariants._(values), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceString.allocationSize(values) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceString.write(
      values,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class IntegersAnyVariants extends AnyVariants {
  final List<int> values;
  IntegersAnyVariants(List<int> this.values);
  IntegersAnyVariants._(List<int> this.values);
  static LiftRetVal<IntegersAnyVariants> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final values_lifted = FfiConverterSequenceInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final values = values_lifted.value;
    new_offset += values_lifted.bytesRead;
    return LiftRetVal(IntegersAnyVariants._(values), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceInt64.allocationSize(values) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceInt64.write(
      values,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class Condition {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterCondition {
  static Condition lift(RustBuffer buffer) {
    return FfiConverterCondition.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Condition> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = FieldConditionVariant.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = IsEmptyCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = IsNullCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = HasIdCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = HasVectorCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = SliceCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 7:
        final lifted = NestedCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 8:
        final lifted = FilterCondition.read(subview);
        return LiftRetVal<Condition>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Condition value) {
    return value.lower();
  }

  static int allocationSize(Condition value) {
    return value.allocationSize();
  }

  static int write(Condition value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class FieldConditionVariant extends Condition {
  final FieldCondition condition;
  FieldConditionVariant(FieldCondition this.condition);
  FieldConditionVariant._(FieldCondition this.condition);
  static LiftRetVal<FieldConditionVariant> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final condition_lifted = FfiConverterFieldCondition.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final condition = condition_lifted.value;
    new_offset += condition_lifted.bytesRead;
    return LiftRetVal(FieldConditionVariant._(condition), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFieldCondition.allocationSize(condition) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterFieldCondition.write(
      condition,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class IsEmptyCondition extends Condition {
  final String key;
  IsEmptyCondition(String this.key);
  IsEmptyCondition._(String this.key);
  static LiftRetVal<IsEmptyCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    return LiftRetVal(IsEmptyCondition._(key), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(key) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      key,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class IsNullCondition extends Condition {
  final String key;
  IsNullCondition(String this.key);
  IsNullCondition._(String this.key);
  static LiftRetVal<IsNullCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    return LiftRetVal(IsNullCondition._(key), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(key) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      key,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class HasIdCondition extends Condition {
  final List<PointId> ids;
  HasIdCondition(List<PointId> this.ids);
  HasIdCondition._(List<PointId> this.ids);
  static LiftRetVal<HasIdCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final ids_lifted = FfiConverterSequencePointId.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final ids = ids_lifted.value;
    new_offset += ids_lifted.bytesRead;
    return LiftRetVal(HasIdCondition._(ids), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequencePointId.allocationSize(ids) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequencePointId.write(
      ids,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class HasVectorCondition extends Condition {
  final String vectorName;
  HasVectorCondition(String this.vectorName);
  HasVectorCondition._(String this.vectorName);
  static LiftRetVal<HasVectorCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vectorName_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vectorName = vectorName_lifted.value;
    new_offset += vectorName_lifted.bytesRead;
    return LiftRetVal(HasVectorCondition._(vectorName), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(vectorName) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      vectorName,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class SliceCondition extends Condition {
  final int total;
  final int index;
  SliceCondition({required int this.total, required int this.index});
  SliceCondition._(int this.total, int this.index);
  static LiftRetVal<SliceCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final total_lifted = FfiConverterUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final total = total_lifted.value;
    new_offset += total_lifted.bytesRead;
    final index_lifted = FfiConverterUInt32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final index = index_lifted.value;
    new_offset += index_lifted.bytesRead;
    return LiftRetVal(SliceCondition._(total, index), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt32.allocationSize(total) +
        FfiConverterUInt32.allocationSize(index) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterUInt32.write(
      total,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt32.write(
      index,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class NestedCondition extends Condition {
  final String key;
  final Filter filter;
  NestedCondition({required String this.key, required Filter this.filter});
  NestedCondition._(String this.key, Filter this.filter);
  static LiftRetVal<NestedCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final key_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final key = key_lifted.value;
    new_offset += key_lifted.bytesRead;
    final filter_lifted = FfiConverterFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    return LiftRetVal(NestedCondition._(key, filter), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(key) +
        FfiConverterFilter.allocationSize(filter) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 7);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      key,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterFilter.write(
      filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FilterCondition extends Condition {
  final Filter filter;
  FilterCondition(Filter this.filter);
  FilterCondition._(Filter this.filter);
  static LiftRetVal<FilterCondition> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final filter_lifted = FfiConverterFilter.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final filter = filter_lifted.value;
    new_offset += filter_lifted.bytesRead;
    return LiftRetVal(FilterCondition._(filter), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFilter.allocationSize(filter) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 8);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterFilter.write(
      filter,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class Match {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterMatch {
  static Match lift(RustBuffer buffer) {
    return FfiConverterMatch.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Match> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = ValueMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = TextMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = TextAnyMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = PhraseMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = PrefixMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = AnyMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 7:
        final lifted = ExceptMatch.read(subview);
        return LiftRetVal<Match>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Match value) {
    return value.lower();
  }

  static int allocationSize(Match value) {
    return value.allocationSize();
  }

  static int write(Match value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class ValueMatch extends Match {
  final ValueVariants value;
  ValueMatch(ValueVariants this.value);
  ValueMatch._(ValueVariants this.value);
  static LiftRetVal<ValueMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterValueVariants.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(ValueMatch._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterValueVariants.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterValueVariants.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class TextMatch extends Match {
  final String text;
  TextMatch(String this.text);
  TextMatch._(String this.text);
  static LiftRetVal<TextMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final text_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final text = text_lifted.value;
    new_offset += text_lifted.bytesRead;
    return LiftRetVal(TextMatch._(text), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(text) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      text,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class TextAnyMatch extends Match {
  final String textAny;
  TextAnyMatch(String this.textAny);
  TextAnyMatch._(String this.textAny);
  static LiftRetVal<TextAnyMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final textAny_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final textAny = textAny_lifted.value;
    new_offset += textAny_lifted.bytesRead;
    return LiftRetVal(TextAnyMatch._(textAny), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(textAny) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      textAny,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class PhraseMatch extends Match {
  final String phrase;
  PhraseMatch(String this.phrase);
  PhraseMatch._(String this.phrase);
  static LiftRetVal<PhraseMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final phrase_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final phrase = phrase_lifted.value;
    new_offset += phrase_lifted.bytesRead;
    return LiftRetVal(PhraseMatch._(phrase), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(phrase) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      phrase,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class PrefixMatch extends Match {
  final String prefix;
  PrefixMatch(String this.prefix);
  PrefixMatch._(String this.prefix);
  static LiftRetVal<PrefixMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final prefix_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final prefix = prefix_lifted.value;
    new_offset += prefix_lifted.bytesRead;
    return LiftRetVal(PrefixMatch._(prefix), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(prefix) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      prefix,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class AnyMatch extends Match {
  final AnyVariants any;
  AnyMatch(AnyVariants this.any);
  AnyMatch._(AnyVariants this.any);
  static LiftRetVal<AnyMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final any_lifted = FfiConverterAnyVariants.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final any = any_lifted.value;
    new_offset += any_lifted.bytesRead;
    return LiftRetVal(AnyMatch._(any), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterAnyVariants.allocationSize(any) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterAnyVariants.write(
      any,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class ExceptMatch extends Match {
  final AnyVariants except;
  ExceptMatch(AnyVariants this.except);
  ExceptMatch._(AnyVariants this.except);
  static LiftRetVal<ExceptMatch> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final except_lifted = FfiConverterAnyVariants.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final except = except_lifted.value;
    new_offset += except_lifted.bytesRead;
    return LiftRetVal(ExceptMatch._(except), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterAnyVariants.allocationSize(except) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 7);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterAnyVariants.write(
      except,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class ValueVariants {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterValueVariants {
  static ValueVariants lift(RustBuffer buffer) {
    return FfiConverterValueVariants.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ValueVariants> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = StringValueVariants.read(subview);
        return LiftRetVal<ValueVariants>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = IntegerValueVariants.read(subview);
        return LiftRetVal<ValueVariants>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = BoolValueVariants.read(subview);
        return LiftRetVal<ValueVariants>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ValueVariants value) {
    return value.lower();
  }

  static int allocationSize(ValueVariants value) {
    return value.allocationSize();
  }

  static int write(ValueVariants value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class StringValueVariants extends ValueVariants {
  final String value;
  StringValueVariants(String this.value);
  StringValueVariants._(String this.value);
  static LiftRetVal<StringValueVariants> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(StringValueVariants._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class IntegerValueVariants extends ValueVariants {
  final int value;
  IntegerValueVariants(int this.value);
  IntegerValueVariants._(int this.value);
  static LiftRetVal<IntegerValueVariants> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(IntegerValueVariants._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class BoolValueVariants extends ValueVariants {
  final bool value;
  BoolValueVariants(bool this.value);
  BoolValueVariants._(bool this.value);
  static LiftRetVal<BoolValueVariants> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(BoolValueVariants._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterBool.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterBool.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum DecayKind { lin, gauss, exp }

class FfiConverterDecayKind {
  static LiftRetVal<DecayKind> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(DecayKind.lin, 4);
      case 2:
        return LiftRetVal(DecayKind.gauss, 4);
      case 3:
        return LiftRetVal(DecayKind.exp, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static DecayKind lift(RustBuffer buffer) {
    return FfiConverterDecayKind.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(DecayKind input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(DecayKind _value) {
    return 4;
  }

  static int write(DecayKind value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class GroupId {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterGroupId {
  static GroupId lift(RustBuffer buffer) {
    return FfiConverterGroupId.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<GroupId> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = StringGroupId.read(subview);
        return LiftRetVal<GroupId>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = NumberU64GroupId.read(subview);
        return LiftRetVal<GroupId>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = NumberI64GroupId.read(subview);
        return LiftRetVal<GroupId>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(GroupId value) {
    return value.lower();
  }

  static int allocationSize(GroupId value) {
    return value.allocationSize();
  }

  static int write(GroupId value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class StringGroupId extends GroupId {
  final String value;
  StringGroupId(String this.value);
  StringGroupId._(String this.value);
  static LiftRetVal<StringGroupId> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(StringGroupId._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class NumberU64GroupId extends GroupId {
  final int value;
  NumberU64GroupId(int this.value);
  NumberU64GroupId._(int this.value);
  static LiftRetVal<NumberU64GroupId> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(NumberU64GroupId._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterUInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class NumberI64GroupId extends GroupId {
  final int value;
  NumberI64GroupId(int this.value);
  NumberI64GroupId._(int this.value);
  static LiftRetVal<NumberI64GroupId> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(NumberI64GroupId._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum Direction { asc, desc }

class FfiConverterDirection {
  static LiftRetVal<Direction> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Direction.asc, 4);
      case 2:
        return LiftRetVal(Direction.desc, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Direction lift(RustBuffer buffer) {
    return FfiConverterDirection.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Direction input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Direction _value) {
    return 4;
  }

  static int write(Direction value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class Fusion {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterFusion {
  static Fusion lift(RustBuffer buffer) {
    return FfiConverterFusion.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Fusion> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = RrfFusion.read(subview);
        return LiftRetVal<Fusion>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = DbsfFusion.read(subview);
        return LiftRetVal<Fusion>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Fusion value) {
    return value.lower();
  }

  static int allocationSize(Fusion value) {
    return value.allocationSize();
  }

  static int write(Fusion value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class RrfFusion extends Fusion {
  final int k;
  final List<double>? weights;
  RrfFusion({required int this.k, required List<double>? this.weights});
  RrfFusion._(int this.k, List<double>? this.weights);
  static LiftRetVal<RrfFusion> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final k_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final k = k_lifted.value;
    new_offset += k_lifted.bytesRead;
    final weights_lifted = FfiConverterOptionalSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final weights = weights_lifted.value;
    new_offset += weights_lifted.bytesRead;
    return LiftRetVal(RrfFusion._(k, weights), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(k) +
        FfiConverterOptionalSequenceDouble32.allocationSize(weights) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterUInt64.write(
      k,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSequenceDouble32.write(
      weights,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class DbsfFusion extends Fusion {
  DbsfFusion();
  DbsfFusion._();
  static LiftRetVal<DbsfFusion> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    return LiftRetVal(DbsfFusion._(), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    return new_offset;
  }
}

abstract class Query {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterQuery {
  static Query lift(RustBuffer buffer) {
    return FfiConverterQuery.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Query> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = NearestQuery.read(subview);
        return LiftRetVal<Query>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = RecommendQuery.read(subview);
        return LiftRetVal<Query>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = DiscoverQuery.read(subview);
        return LiftRetVal<Query>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = ContextQuery.read(subview);
        return LiftRetVal<Query>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = FeedbackQuery.read(subview);
        return LiftRetVal<Query>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Query value) {
    return value.lower();
  }

  static int allocationSize(Query value) {
    return value.allocationSize();
  }

  static int write(Query value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class NearestQuery extends Query {
  final NamedVector vector;
  final String? using;
  NearestQuery({required NamedVector this.vector, required String? this.using});
  NearestQuery._(NamedVector this.vector, String? this.using);
  static LiftRetVal<NearestQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vector_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(NearestQuery._(vector, using), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterNamedVector.allocationSize(vector) +
        FfiConverterOptionalString.allocationSize(using) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterNamedVector.write(
      vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class RecommendQuery extends Query {
  final List<NamedVector> positives;
  final List<NamedVector> negatives;
  final RecommendStrategy? strategy;
  final String? using;
  RecommendQuery({
    required List<NamedVector> this.positives,
    required List<NamedVector> this.negatives,
    required RecommendStrategy? this.strategy,
    required String? this.using,
  });
  RecommendQuery._(
    List<NamedVector> this.positives,
    List<NamedVector> this.negatives,
    RecommendStrategy? this.strategy,
    String? this.using,
  );
  static LiftRetVal<RecommendQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final positives_lifted = FfiConverterSequenceNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final positives = positives_lifted.value;
    new_offset += positives_lifted.bytesRead;
    final negatives_lifted = FfiConverterSequenceNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final negatives = negatives_lifted.value;
    new_offset += negatives_lifted.bytesRead;
    final strategy_lifted = FfiConverterOptionalRecommendStrategy.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final strategy = strategy_lifted.value;
    new_offset += strategy_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(
      RecommendQuery._(positives, negatives, strategy, using),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceNamedVector.allocationSize(positives) +
        FfiConverterSequenceNamedVector.allocationSize(negatives) +
        FfiConverterOptionalRecommendStrategy.allocationSize(strategy) +
        FfiConverterOptionalString.allocationSize(using) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceNamedVector.write(
      positives,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceNamedVector.write(
      negatives,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalRecommendStrategy.write(
      strategy,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class DiscoverQuery extends Query {
  final NamedVector target;
  final List<ContextPair> context;
  final String? using;
  DiscoverQuery({
    required NamedVector this.target,
    required List<ContextPair> this.context,
    required String? this.using,
  });
  DiscoverQuery._(
    NamedVector this.target,
    List<ContextPair> this.context,
    String? this.using,
  );
  static LiftRetVal<DiscoverQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final target_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final target = target_lifted.value;
    new_offset += target_lifted.bytesRead;
    final context_lifted = FfiConverterSequenceContextPair.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final context = context_lifted.value;
    new_offset += context_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(DiscoverQuery._(target, context, using), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterNamedVector.allocationSize(target) +
        FfiConverterSequenceContextPair.allocationSize(context) +
        FfiConverterOptionalString.allocationSize(using) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterNamedVector.write(
      target,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceContextPair.write(
      context,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class ContextQuery extends Query {
  final List<ContextPair> context;
  final String? using;
  ContextQuery({
    required List<ContextPair> this.context,
    required String? this.using,
  });
  ContextQuery._(List<ContextPair> this.context, String? this.using);
  static LiftRetVal<ContextQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final context_lifted = FfiConverterSequenceContextPair.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final context = context_lifted.value;
    new_offset += context_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(ContextQuery._(context, using), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceContextPair.allocationSize(context) +
        FfiConverterOptionalString.allocationSize(using) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceContextPair.write(
      context,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FeedbackQuery extends Query {
  final NamedVector target;
  final List<FeedbackItem> feedback;
  final FeedbackCoefficients coefficients;
  final String? using;
  FeedbackQuery({
    required NamedVector this.target,
    required List<FeedbackItem> this.feedback,
    required FeedbackCoefficients this.coefficients,
    required String? this.using,
  });
  FeedbackQuery._(
    NamedVector this.target,
    List<FeedbackItem> this.feedback,
    FeedbackCoefficients this.coefficients,
    String? this.using,
  );
  static LiftRetVal<FeedbackQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final target_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final target = target_lifted.value;
    new_offset += target_lifted.bytesRead;
    final feedback_lifted = FfiConverterSequenceFeedbackItem.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final feedback = feedback_lifted.value;
    new_offset += feedback_lifted.bytesRead;
    final coefficients_lifted = FfiConverterFeedbackCoefficients.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final coefficients = coefficients_lifted.value;
    new_offset += coefficients_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    return LiftRetVal(
      FeedbackQuery._(target, feedback, coefficients, using),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterNamedVector.allocationSize(target) +
        FfiConverterSequenceFeedbackItem.allocationSize(feedback) +
        FfiConverterFeedbackCoefficients.allocationSize(coefficients) +
        FfiConverterOptionalString.allocationSize(using) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterNamedVector.write(
      target,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterSequenceFeedbackItem.write(
      feedback,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterFeedbackCoefficients.write(
      coefficients,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum RecommendStrategy { bestScore, sumScores }

class FfiConverterRecommendStrategy {
  static LiftRetVal<RecommendStrategy> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(RecommendStrategy.bestScore, 4);
      case 2:
        return LiftRetVal(RecommendStrategy.sumScores, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RecommendStrategy lift(RustBuffer buffer) {
    return FfiConverterRecommendStrategy.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(RecommendStrategy input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(RecommendStrategy _value) {
    return 4;
  }

  static int write(RecommendStrategy value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum Sample { random }

class FfiConverterSample {
  static LiftRetVal<Sample> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Sample.random, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Sample lift(RustBuffer buffer) {
    return FfiConverterSample.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Sample input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Sample _value) {
    return 4;
  }

  static int write(Sample value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class ScoringQuery {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterScoringQuery {
  static ScoringQuery lift(RustBuffer buffer) {
    return FfiConverterScoringQuery.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<ScoringQuery> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = VectorScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FusionScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = OrderByScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = FormulaScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = MmrScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = SampleScoringQuery.read(subview);
        return LiftRetVal<ScoringQuery>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(ScoringQuery value) {
    return value.lower();
  }

  static int allocationSize(ScoringQuery value) {
    return value.allocationSize();
  }

  static int write(ScoringQuery value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class VectorScoringQuery extends ScoringQuery {
  final Query query;
  VectorScoringQuery(Query this.query);
  VectorScoringQuery._(Query this.query);
  static LiftRetVal<VectorScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final query_lifted = FfiConverterQuery.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final query = query_lifted.value;
    new_offset += query_lifted.bytesRead;
    return LiftRetVal(VectorScoringQuery._(query), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterQuery.allocationSize(query) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterQuery.write(
      query,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FusionScoringQuery extends ScoringQuery {
  final Fusion fusion;
  FusionScoringQuery(Fusion this.fusion);
  FusionScoringQuery._(Fusion this.fusion);
  static LiftRetVal<FusionScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final fusion_lifted = FfiConverterFusion.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final fusion = fusion_lifted.value;
    new_offset += fusion_lifted.bytesRead;
    return LiftRetVal(FusionScoringQuery._(fusion), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFusion.allocationSize(fusion) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterFusion.write(
      fusion,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class OrderByScoringQuery extends ScoringQuery {
  final OrderBy orderBy;
  OrderByScoringQuery(OrderBy this.orderBy);
  OrderByScoringQuery._(OrderBy this.orderBy);
  static LiftRetVal<OrderByScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final orderBy_lifted = FfiConverterOrderBy.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final orderBy = orderBy_lifted.value;
    new_offset += orderBy_lifted.bytesRead;
    return LiftRetVal(OrderByScoringQuery._(orderBy), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterOrderBy.allocationSize(orderBy) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterOrderBy.write(
      orderBy,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FormulaScoringQuery extends ScoringQuery {
  final Expression expression;
  final Map<String, String> defaults;
  FormulaScoringQuery({
    required Expression this.expression,
    required Map<String, String> this.defaults,
  });
  FormulaScoringQuery._(
    Expression this.expression,
    Map<String, String> this.defaults,
  );
  static LiftRetVal<FormulaScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final expression_lifted = Expression.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final expression = expression_lifted.value;
    new_offset += expression_lifted.bytesRead;
    final defaults_lifted = FfiConverterMapStringToString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final defaults = defaults_lifted.value;
    new_offset += defaults_lifted.bytesRead;
    return LiftRetVal(FormulaScoringQuery._(expression, defaults), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return Expression.allocationSize(expression) +
        FfiConverterMapStringToString.allocationSize(defaults) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += Expression.write(
      expression,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterMapStringToString.write(
      defaults,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class MmrScoringQuery extends ScoringQuery {
  final NamedVector vector;
  final String? using;
  final double lambda;
  final int candidatesLimit;
  MmrScoringQuery({
    required NamedVector this.vector,
    required String? this.using,
    required double this.lambda,
    required int this.candidatesLimit,
  });
  MmrScoringQuery._(
    NamedVector this.vector,
    String? this.using,
    double this.lambda,
    int this.candidatesLimit,
  );
  static LiftRetVal<MmrScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vector_lifted = FfiConverterNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    final using_lifted = FfiConverterOptionalString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final using = using_lifted.value;
    new_offset += using_lifted.bytesRead;
    final lambda_lifted = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final lambda = lambda_lifted.value;
    new_offset += lambda_lifted.bytesRead;
    final candidatesLimit_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final candidatesLimit = candidatesLimit_lifted.value;
    new_offset += candidatesLimit_lifted.bytesRead;
    return LiftRetVal(
      MmrScoringQuery._(vector, using, lambda, candidatesLimit),
      new_offset,
    );
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterNamedVector.allocationSize(vector) +
        FfiConverterOptionalString.allocationSize(using) +
        FfiConverterDouble32.allocationSize(lambda) +
        FfiConverterUInt64.allocationSize(candidatesLimit) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterNamedVector.write(
      vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalString.write(
      using,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterDouble32.write(
      lambda,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterUInt64.write(
      candidatesLimit,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class SampleScoringQuery extends ScoringQuery {
  final Sample sample;
  SampleScoringQuery(Sample this.sample);
  SampleScoringQuery._(Sample this.sample);
  static LiftRetVal<SampleScoringQuery> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final sample_int = buf.buffer.asByteData(new_offset).getInt32(0);
    final sample = FfiConverterSample.lift(
      toRustBuffer(createUint8ListFromInt(sample_int)),
    );
    new_offset += 4;
    return LiftRetVal(SampleScoringQuery._(sample), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4 + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;
    final sample_buffer = FfiConverterSample.lower(sample);
    final sample_int = sample_buffer.asUint8List().buffer.asByteData().getInt32(
      0,
    );
    buf.buffer.asByteData(new_offset).setInt32(0, sample_int);
    new_offset += 4;
    return new_offset;
  }
}

abstract class StartFrom {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterStartFrom {
  static StartFrom lift(RustBuffer buffer) {
    return FfiConverterStartFrom.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<StartFrom> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = IntegerStartFrom.read(subview);
        return LiftRetVal<StartFrom>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FloatStartFrom.read(subview);
        return LiftRetVal<StartFrom>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = DatetimeStartFrom.read(subview);
        return LiftRetVal<StartFrom>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(StartFrom value) {
    return value.lower();
  }

  static int allocationSize(StartFrom value) {
    return value.allocationSize();
  }

  static int write(StartFrom value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class IntegerStartFrom extends StartFrom {
  final int value;
  IntegerStartFrom(int this.value);
  IntegerStartFrom._(int this.value);
  static LiftRetVal<IntegerStartFrom> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(IntegerStartFrom._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FloatStartFrom extends StartFrom {
  final double value;
  FloatStartFrom(double this.value);
  FloatStartFrom._(double this.value);
  static LiftRetVal<FloatStartFrom> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(FloatStartFrom._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterDouble64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterDouble64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class DatetimeStartFrom extends StartFrom {
  final String value;
  DatetimeStartFrom(String this.value);
  DatetimeStartFrom._(String this.value);
  static LiftRetVal<DatetimeStartFrom> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(DatetimeStartFrom._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum Language {
  arabic,
  azerbaijani,
  basque,
  bengali,
  catalan,
  chinese,
  danish,
  dutch,
  english,
  finnish,
  french,
  german,
  greek,
  hebrew,
  hinglish,
  hungarian,
  indonesian,
  italian,
  japanese,
  kazakh,
  nepali,
  norwegian,
  portuguese,
  romanian,
  russian,
  slovene,
  spanish,
  swedish,
  tajik,
  turkish,
}

class FfiConverterLanguage {
  static LiftRetVal<Language> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(Language.arabic, 4);
      case 2:
        return LiftRetVal(Language.azerbaijani, 4);
      case 3:
        return LiftRetVal(Language.basque, 4);
      case 4:
        return LiftRetVal(Language.bengali, 4);
      case 5:
        return LiftRetVal(Language.catalan, 4);
      case 6:
        return LiftRetVal(Language.chinese, 4);
      case 7:
        return LiftRetVal(Language.danish, 4);
      case 8:
        return LiftRetVal(Language.dutch, 4);
      case 9:
        return LiftRetVal(Language.english, 4);
      case 10:
        return LiftRetVal(Language.finnish, 4);
      case 11:
        return LiftRetVal(Language.french, 4);
      case 12:
        return LiftRetVal(Language.german, 4);
      case 13:
        return LiftRetVal(Language.greek, 4);
      case 14:
        return LiftRetVal(Language.hebrew, 4);
      case 15:
        return LiftRetVal(Language.hinglish, 4);
      case 16:
        return LiftRetVal(Language.hungarian, 4);
      case 17:
        return LiftRetVal(Language.indonesian, 4);
      case 18:
        return LiftRetVal(Language.italian, 4);
      case 19:
        return LiftRetVal(Language.japanese, 4);
      case 20:
        return LiftRetVal(Language.kazakh, 4);
      case 21:
        return LiftRetVal(Language.nepali, 4);
      case 22:
        return LiftRetVal(Language.norwegian, 4);
      case 23:
        return LiftRetVal(Language.portuguese, 4);
      case 24:
        return LiftRetVal(Language.romanian, 4);
      case 25:
        return LiftRetVal(Language.russian, 4);
      case 26:
        return LiftRetVal(Language.slovene, 4);
      case 27:
        return LiftRetVal(Language.spanish, 4);
      case 28:
        return LiftRetVal(Language.swedish, 4);
      case 29:
        return LiftRetVal(Language.tajik, 4);
      case 30:
        return LiftRetVal(Language.turkish, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static Language lift(RustBuffer buffer) {
    return FfiConverterLanguage.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(Language input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(Language _value) {
    return 4;
  }

  static int write(Language value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class PayloadIndexParams {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterPayloadIndexParams {
  static PayloadIndexParams lift(RustBuffer buffer) {
    return FfiConverterPayloadIndexParams.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<PayloadIndexParams> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = KeywordPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = IntegerPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = FloatPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 4:
        final lifted = GeoPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 5:
        final lifted = TextPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 6:
        final lifted = BoolPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 7:
        final lifted = DatetimePayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 8:
        final lifted = UuidPayloadIndexParams.read(subview);
        return LiftRetVal<PayloadIndexParams>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(PayloadIndexParams value) {
    return value.lower();
  }

  static int allocationSize(PayloadIndexParams value) {
    return value.allocationSize();
  }

  static int write(PayloadIndexParams value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class KeywordPayloadIndexParams extends PayloadIndexParams {
  final KeywordIndexParams config;
  KeywordPayloadIndexParams(KeywordIndexParams this.config);
  KeywordPayloadIndexParams._(KeywordIndexParams this.config);
  static LiftRetVal<KeywordPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterKeywordIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(KeywordPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterKeywordIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterKeywordIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class IntegerPayloadIndexParams extends PayloadIndexParams {
  final IntegerIndexParams config;
  IntegerPayloadIndexParams(IntegerIndexParams this.config);
  IntegerPayloadIndexParams._(IntegerIndexParams this.config);
  static LiftRetVal<IntegerPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterIntegerIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(IntegerPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterIntegerIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterIntegerIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FloatPayloadIndexParams extends PayloadIndexParams {
  final FloatIndexParams config;
  FloatPayloadIndexParams(FloatIndexParams this.config);
  FloatPayloadIndexParams._(FloatIndexParams this.config);
  static LiftRetVal<FloatPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterFloatIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(FloatPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterFloatIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterFloatIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class GeoPayloadIndexParams extends PayloadIndexParams {
  final GeoIndexParams config;
  GeoPayloadIndexParams(GeoIndexParams this.config);
  GeoPayloadIndexParams._(GeoIndexParams this.config);
  static LiftRetVal<GeoPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterGeoIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(GeoPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterGeoIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 4);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterGeoIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class TextPayloadIndexParams extends PayloadIndexParams {
  final TextIndexParams config;
  TextPayloadIndexParams(TextIndexParams this.config);
  TextPayloadIndexParams._(TextIndexParams this.config);
  static LiftRetVal<TextPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterTextIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(TextPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterTextIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 5);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterTextIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class BoolPayloadIndexParams extends PayloadIndexParams {
  final BoolIndexParams config;
  BoolPayloadIndexParams(BoolIndexParams this.config);
  BoolPayloadIndexParams._(BoolIndexParams this.config);
  static LiftRetVal<BoolPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterBoolIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(BoolPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterBoolIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 6);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterBoolIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class DatetimePayloadIndexParams extends PayloadIndexParams {
  final DatetimeIndexParams config;
  DatetimePayloadIndexParams(DatetimeIndexParams this.config);
  DatetimePayloadIndexParams._(DatetimeIndexParams this.config);
  static LiftRetVal<DatetimePayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterDatetimeIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(DatetimePayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterDatetimeIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 7);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterDatetimeIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class UuidPayloadIndexParams extends PayloadIndexParams {
  final UuidIndexParams config;
  UuidPayloadIndexParams(UuidIndexParams this.config);
  UuidPayloadIndexParams._(UuidIndexParams this.config);
  static LiftRetVal<UuidPayloadIndexParams> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final config_lifted = FfiConverterUuidIndexParams.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final config = config_lifted.value;
    new_offset += config_lifted.bytesRead;
    return LiftRetVal(UuidPayloadIndexParams._(config), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUuidIndexParams.allocationSize(config) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 8);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterUuidIndexParams.write(
      config,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum SnowballLanguage {
  arabic,
  armenian,
  danish,
  dutch,
  english,
  finnish,
  french,
  german,
  greek,
  hungarian,
  italian,
  norwegian,
  portuguese,
  romanian,
  russian,
  spanish,
  swedish,
  tamil,
  turkish,
}

class FfiConverterSnowballLanguage {
  static LiftRetVal<SnowballLanguage> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(SnowballLanguage.arabic, 4);
      case 2:
        return LiftRetVal(SnowballLanguage.armenian, 4);
      case 3:
        return LiftRetVal(SnowballLanguage.danish, 4);
      case 4:
        return LiftRetVal(SnowballLanguage.dutch, 4);
      case 5:
        return LiftRetVal(SnowballLanguage.english, 4);
      case 6:
        return LiftRetVal(SnowballLanguage.finnish, 4);
      case 7:
        return LiftRetVal(SnowballLanguage.french, 4);
      case 8:
        return LiftRetVal(SnowballLanguage.german, 4);
      case 9:
        return LiftRetVal(SnowballLanguage.greek, 4);
      case 10:
        return LiftRetVal(SnowballLanguage.hungarian, 4);
      case 11:
        return LiftRetVal(SnowballLanguage.italian, 4);
      case 12:
        return LiftRetVal(SnowballLanguage.norwegian, 4);
      case 13:
        return LiftRetVal(SnowballLanguage.portuguese, 4);
      case 14:
        return LiftRetVal(SnowballLanguage.romanian, 4);
      case 15:
        return LiftRetVal(SnowballLanguage.russian, 4);
      case 16:
        return LiftRetVal(SnowballLanguage.spanish, 4);
      case 17:
        return LiftRetVal(SnowballLanguage.swedish, 4);
      case 18:
        return LiftRetVal(SnowballLanguage.tamil, 4);
      case 19:
        return LiftRetVal(SnowballLanguage.turkish, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static SnowballLanguage lift(RustBuffer buffer) {
    return FfiConverterSnowballLanguage.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(SnowballLanguage input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(SnowballLanguage _value) {
    return 4;
  }

  static int write(SnowballLanguage value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class Stemmer {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterStemmer {
  static Stemmer lift(RustBuffer buffer) {
    return FfiConverterStemmer.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Stemmer> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = SnowballStemmer.read(subview);
        return LiftRetVal<Stemmer>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = DisabledStemmer.read(subview);
        return LiftRetVal<Stemmer>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Stemmer value) {
    return value.lower();
  }

  static int allocationSize(Stemmer value) {
    return value.allocationSize();
  }

  static int write(Stemmer value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class SnowballStemmer extends Stemmer {
  final SnowballLanguage language;
  SnowballStemmer(SnowballLanguage this.language);
  SnowballStemmer._(SnowballLanguage this.language);
  static LiftRetVal<SnowballStemmer> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final language_int = buf.buffer.asByteData(new_offset).getInt32(0);
    final language = FfiConverterSnowballLanguage.lift(
      toRustBuffer(createUint8ListFromInt(language_int)),
    );
    new_offset += 4;
    return LiftRetVal(SnowballStemmer._(language), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4 + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    final language_buffer = FfiConverterSnowballLanguage.lower(language);
    final language_int = language_buffer
        .asUint8List()
        .buffer
        .asByteData()
        .getInt32(0);
    buf.buffer.asByteData(new_offset).setInt32(0, language_int);
    new_offset += 4;
    return new_offset;
  }
}

class DisabledStemmer extends Stemmer {
  DisabledStemmer();
  DisabledStemmer._();
  static LiftRetVal<DisabledStemmer> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    return LiftRetVal(DisabledStemmer._(), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    return new_offset;
  }
}

abstract class Stopwords {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterStopwords {
  static Stopwords lift(RustBuffer buffer) {
    return FfiConverterStopwords.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Stopwords> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = LanguageStopwords.read(subview);
        return LiftRetVal<Stopwords>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = SetStopwords.read(subview);
        return LiftRetVal<Stopwords>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Stopwords value) {
    return value.lower();
  }

  static int allocationSize(Stopwords value) {
    return value.allocationSize();
  }

  static int write(Stopwords value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class LanguageStopwords extends Stopwords {
  final Language language;
  LanguageStopwords(Language this.language);
  LanguageStopwords._(Language this.language);
  static LiftRetVal<LanguageStopwords> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final language_int = buf.buffer.asByteData(new_offset).getInt32(0);
    final language = FfiConverterLanguage.lift(
      toRustBuffer(createUint8ListFromInt(language_int)),
    );
    new_offset += 4;
    return LiftRetVal(LanguageStopwords._(language), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return 4 + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    final language_buffer = FfiConverterLanguage.lower(language);
    final language_int = language_buffer
        .asUint8List()
        .buffer
        .asByteData()
        .getInt32(0);
    buf.buffer.asByteData(new_offset).setInt32(0, language_int);
    new_offset += 4;
    return new_offset;
  }
}

class SetStopwords extends Stopwords {
  final List<Language>? languages;
  final List<String>? custom;
  SetStopwords({
    required List<Language>? this.languages,
    required List<String>? this.custom,
  });
  SetStopwords._(List<Language>? this.languages, List<String>? this.custom);
  static LiftRetVal<SetStopwords> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final languages_lifted = FfiConverterOptionalSequenceLanguage.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final languages = languages_lifted.value;
    new_offset += languages_lifted.bytesRead;
    final custom_lifted = FfiConverterOptionalSequenceString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final custom = custom_lifted.value;
    new_offset += custom_lifted.bytesRead;
    return LiftRetVal(SetStopwords._(languages, custom), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterOptionalSequenceLanguage.allocationSize(languages) +
        FfiConverterOptionalSequenceString.allocationSize(custom) +
        4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterOptionalSequenceLanguage.write(
      languages,
      Uint8List.view(buf.buffer, new_offset),
    );
    new_offset += FfiConverterOptionalSequenceString.write(
      custom,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum TokenizerType { prefix, whitespace, word, multilingual }

class FfiConverterTokenizerType {
  static LiftRetVal<TokenizerType> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(TokenizerType.prefix, 4);
      case 2:
        return LiftRetVal(TokenizerType.whitespace, 4);
      case 3:
        return LiftRetVal(TokenizerType.word, 4);
      case 4:
        return LiftRetVal(TokenizerType.multilingual, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static TokenizerType lift(RustBuffer buffer) {
    return FfiConverterTokenizerType.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(TokenizerType input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(TokenizerType _value) {
    return 4;
  }

  static int write(TokenizerType value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class NamedVector {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterNamedVector {
  static NamedVector lift(RustBuffer buffer) {
    return FfiConverterNamedVector.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<NamedVector> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = DenseNamedVector.read(subview);
        return LiftRetVal<NamedVector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = SparseNamedVector.read(subview);
        return LiftRetVal<NamedVector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = MultiDenseNamedVector.read(subview);
        return LiftRetVal<NamedVector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(NamedVector value) {
    return value.lower();
  }

  static int allocationSize(NamedVector value) {
    return value.allocationSize();
  }

  static int write(NamedVector value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class DenseNamedVector extends NamedVector {
  final List<double> values;
  DenseNamedVector(List<double> this.values);
  DenseNamedVector._(List<double> this.values);
  static LiftRetVal<DenseNamedVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final values_lifted = FfiConverterSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final values = values_lifted.value;
    new_offset += values_lifted.bytesRead;
    return LiftRetVal(DenseNamedVector._(values), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceDouble32.allocationSize(values) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceDouble32.write(
      values,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class SparseNamedVector extends NamedVector {
  final SparseVector vector;
  SparseNamedVector(SparseVector this.vector);
  SparseNamedVector._(SparseVector this.vector);
  static LiftRetVal<SparseNamedVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vector_lifted = FfiConverterSparseVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vector = vector_lifted.value;
    new_offset += vector_lifted.bytesRead;
    return LiftRetVal(SparseNamedVector._(vector), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSparseVector.allocationSize(vector) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSparseVector.write(
      vector,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class MultiDenseNamedVector extends NamedVector {
  final List<List<double>> vectors;
  MultiDenseNamedVector(List<List<double>> this.vectors);
  MultiDenseNamedVector._(List<List<double>> this.vectors);
  static LiftRetVal<MultiDenseNamedVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vectors_lifted = FfiConverterSequenceSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vectors = vectors_lifted.value;
    new_offset += vectors_lifted.bytesRead;
    return LiftRetVal(MultiDenseNamedVector._(vectors), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceSequenceDouble32.allocationSize(vectors) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceSequenceDouble32.write(
      vectors,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class OrderValue {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterOrderValue {
  static OrderValue lift(RustBuffer buffer) {
    return FfiConverterOrderValue.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<OrderValue> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = IntOrderValue.read(subview);
        return LiftRetVal<OrderValue>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FloatOrderValue.read(subview);
        return LiftRetVal<OrderValue>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(OrderValue value) {
    return value.lower();
  }

  static int allocationSize(OrderValue value) {
    return value.allocationSize();
  }

  static int write(OrderValue value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class IntOrderValue extends OrderValue {
  final int value;
  IntOrderValue(int this.value);
  IntOrderValue._(int this.value);
  static LiftRetVal<IntOrderValue> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(IntOrderValue._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FloatOrderValue extends OrderValue {
  final double value;
  FloatOrderValue(double this.value);
  FloatOrderValue._(double this.value);
  static LiftRetVal<FloatOrderValue> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(FloatOrderValue._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterDouble64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterDouble64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class PointId {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterPointId {
  static PointId lift(RustBuffer buffer) {
    return FfiConverterPointId.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<PointId> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = NumIdPointId.read(subview);
        return LiftRetVal<PointId>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = UuidPointId.read(subview);
        return LiftRetVal<PointId>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(PointId value) {
    return value.lower();
  }

  static int allocationSize(PointId value) {
    return value.allocationSize();
  }

  static int write(PointId value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class NumIdPointId extends PointId {
  final int value;
  NumIdPointId(int this.value);
  NumIdPointId._(int this.value);
  static LiftRetVal<NumIdPointId> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(NumIdPointId._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterUInt64.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterUInt64.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class UuidPointId extends PointId {
  final String value;
  UuidPointId(String this.value);
  UuidPointId._(String this.value);
  static LiftRetVal<UuidPointId> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final value_lifted = FfiConverterString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final value = value_lifted.value;
    new_offset += value_lifted.bytesRead;
    return LiftRetVal(UuidPointId._(value), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterString.allocationSize(value) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterString.write(
      value,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class Vector {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterVector {
  static Vector lift(RustBuffer buffer) {
    return FfiConverterVector.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<Vector> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = SingleVector.read(subview);
        return LiftRetVal<Vector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = MultiDenseVector.read(subview);
        return LiftRetVal<Vector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = NamedVectorVariant.read(subview);
        return LiftRetVal<Vector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(Vector value) {
    return value.lower();
  }

  static int allocationSize(Vector value) {
    return value.allocationSize();
  }

  static int write(Vector value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class SingleVector extends Vector {
  final List<double> values;
  SingleVector(List<double> this.values);
  SingleVector._(List<double> this.values);
  static LiftRetVal<SingleVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final values_lifted = FfiConverterSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final values = values_lifted.value;
    new_offset += values_lifted.bytesRead;
    return LiftRetVal(SingleVector._(values), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceDouble32.allocationSize(values) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceDouble32.write(
      values,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class MultiDenseVector extends Vector {
  final List<List<double>> vectors;
  MultiDenseVector(List<List<double>> this.vectors);
  MultiDenseVector._(List<List<double>> this.vectors);
  static LiftRetVal<MultiDenseVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final vectors_lifted = FfiConverterSequenceSequenceDouble32.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final vectors = vectors_lifted.value;
    new_offset += vectors_lifted.bytesRead;
    return LiftRetVal(MultiDenseVector._(vectors), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceSequenceDouble32.allocationSize(vectors) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceSequenceDouble32.write(
      vectors,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class NamedVectorVariant extends Vector {
  final Map<String, NamedVector> map;
  NamedVectorVariant(Map<String, NamedVector> this.map);
  NamedVectorVariant._(Map<String, NamedVector> this.map);
  static LiftRetVal<NamedVectorVariant> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final map_lifted = FfiConverterMapStringToNamedVector.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final map = map_lifted.value;
    new_offset += map_lifted.bytesRead;
    return LiftRetVal(NamedVectorVariant._(map), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterMapStringToNamedVector.allocationSize(map) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterMapStringToNamedVector.write(
      map,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class WithPayload {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterWithPayload {
  static WithPayload lift(RustBuffer buffer) {
    return FfiConverterWithPayload.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<WithPayload> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = BoolWithPayload.read(subview);
        return LiftRetVal<WithPayload>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = FieldsWithPayload.read(subview);
        return LiftRetVal<WithPayload>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 3:
        final lifted = ExcludeWithPayload.read(subview);
        return LiftRetVal<WithPayload>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(WithPayload value) {
    return value.lower();
  }

  static int allocationSize(WithPayload value) {
    return value.allocationSize();
  }

  static int write(WithPayload value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class BoolWithPayload extends WithPayload {
  final bool enable;
  BoolWithPayload(bool this.enable);
  BoolWithPayload._(bool this.enable);
  static LiftRetVal<BoolWithPayload> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final enable_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enable = enable_lifted.value;
    new_offset += enable_lifted.bytesRead;
    return LiftRetVal(BoolWithPayload._(enable), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterBool.allocationSize(enable) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterBool.write(
      enable,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class FieldsWithPayload extends WithPayload {
  final List<String> fields;
  FieldsWithPayload(List<String> this.fields);
  FieldsWithPayload._(List<String> this.fields);
  static LiftRetVal<FieldsWithPayload> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final fields_lifted = FfiConverterSequenceString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final fields = fields_lifted.value;
    new_offset += fields_lifted.bytesRead;
    return LiftRetVal(FieldsWithPayload._(fields), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceString.allocationSize(fields) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceString.write(
      fields,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class ExcludeWithPayload extends WithPayload {
  final List<String> fields;
  ExcludeWithPayload(List<String> this.fields);
  ExcludeWithPayload._(List<String> this.fields);
  static LiftRetVal<ExcludeWithPayload> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final fields_lifted = FfiConverterSequenceString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final fields = fields_lifted.value;
    new_offset += fields_lifted.bytesRead;
    return LiftRetVal(ExcludeWithPayload._(fields), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceString.allocationSize(fields) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 3);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceString.write(
      fields,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

abstract class WithVector {
  RustBuffer lower();
  int allocationSize();
  int write(Uint8List buf);
}

class FfiConverterWithVector {
  static WithVector lift(RustBuffer buffer) {
    return FfiConverterWithVector.read(buffer.asUint8List()).value;
  }

  static LiftRetVal<WithVector> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    final subview = Uint8List.view(buf.buffer, buf.offsetInBytes + 4);
    switch (index) {
      case 1:
        final lifted = BoolWithVector.read(subview);
        return LiftRetVal<WithVector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      case 2:
        final lifted = NamesWithVector.read(subview);
        return LiftRetVal<WithVector>(
          lifted.value,
          lifted.bytesRead - subview.offsetInBytes + 4,
        );
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static RustBuffer lower(WithVector value) {
    return value.lower();
  }

  static int allocationSize(WithVector value) {
    return value.allocationSize();
  }

  static int write(WithVector value, Uint8List buf) {
    return value.write(buf) - buf.offsetInBytes;
  }
}

class BoolWithVector extends WithVector {
  final bool enable;
  BoolWithVector(bool this.enable);
  BoolWithVector._(bool this.enable);
  static LiftRetVal<BoolWithVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final enable_lifted = FfiConverterBool.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final enable = enable_lifted.value;
    new_offset += enable_lifted.bytesRead;
    return LiftRetVal(BoolWithVector._(enable), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterBool.allocationSize(enable) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 1);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterBool.write(
      enable,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

class NamesWithVector extends WithVector {
  final List<String> names;
  NamesWithVector(List<String> this.names);
  NamesWithVector._(List<String> this.names);
  static LiftRetVal<NamesWithVector> read(Uint8List buf) {
    int new_offset = buf.offsetInBytes;
    final names_lifted = FfiConverterSequenceString.read(
      Uint8List.view(buf.buffer, new_offset),
    );
    final names = names_lifted.value;
    new_offset += names_lifted.bytesRead;
    return LiftRetVal(NamesWithVector._(names), new_offset);
  }

  @override
  RustBuffer lower() {
    final buf = Uint8List(allocationSize());
    write(buf);
    return toRustBuffer(buf);
  }

  @override
  int allocationSize() {
    return FfiConverterSequenceString.allocationSize(names) + 4;
  }

  @override
  int write(Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, 2);
    int new_offset = buf.offsetInBytes + 4;
    new_offset += FfiConverterSequenceString.write(
      names,
      Uint8List.view(buf.buffer, new_offset),
    );
    return new_offset;
  }
}

enum PayloadSchemaType {
  keyword,
  integer,
  float,
  geo,
  text,
  bool,
  datetime,
  uuid,
}

class FfiConverterPayloadSchemaType {
  static LiftRetVal<PayloadSchemaType> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(PayloadSchemaType.keyword, 4);
      case 2:
        return LiftRetVal(PayloadSchemaType.integer, 4);
      case 3:
        return LiftRetVal(PayloadSchemaType.float, 4);
      case 4:
        return LiftRetVal(PayloadSchemaType.geo, 4);
      case 5:
        return LiftRetVal(PayloadSchemaType.text, 4);
      case 6:
        return LiftRetVal(PayloadSchemaType.bool, 4);
      case 7:
        return LiftRetVal(PayloadSchemaType.datetime, 4);
      case 8:
        return LiftRetVal(PayloadSchemaType.uuid, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static PayloadSchemaType lift(RustBuffer buffer) {
    return FfiConverterPayloadSchemaType.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(PayloadSchemaType input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(PayloadSchemaType _value) {
    return 4;
  }

  static int write(PayloadSchemaType value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

enum UpdateMode { upsert, insertOnly, updateOnly }

class FfiConverterUpdateMode {
  static LiftRetVal<UpdateMode> read(Uint8List buf) {
    final index = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    switch (index) {
      case 1:
        return LiftRetVal(UpdateMode.upsert, 4);
      case 2:
        return LiftRetVal(UpdateMode.insertOnly, 4);
      case 3:
        return LiftRetVal(UpdateMode.updateOnly, 4);
      default:
        throw UniffiInternalError(
          UniffiInternalError.unexpectedEnumCase,
          "Unable to determine enum variant",
        );
    }
  }

  static UpdateMode lift(RustBuffer buffer) {
    return FfiConverterUpdateMode.read(buffer.asUint8List()).value;
  }

  static RustBuffer lower(UpdateMode input) {
    return toRustBuffer(createUint8ListFromInt(input.index + 1));
  }

  static int allocationSize(UpdateMode _value) {
    return 4;
  }

  static int write(UpdateMode value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.index + 1);
    return 4;
  }
}

abstract class ExpressionInterface {}

final _ExpressionFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_qdrant_edge_ffi_fn_free_expression(ptr, status));
});

class Expression implements ExpressionInterface {
  late final Pointer<Void> _ptr;
  Expression._(this._ptr) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.abs({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_abs(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.condition({required Condition condition})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_condition(
          FfiConverterCondition.lower(condition),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.constant({required double value})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_constant(
          value,
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.datetime({required String value})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_datetime(
          FfiConverterString.lower(value),
          status,
        ),
        null,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.datetimeKey({required String key})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_expression_datetime_key(
              FfiConverterString.lower(key),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.decay({
    required DecayKind kind,
    required Expression x,
    Expression? target = null,
    double? midpoint = null,
    double? scale = null,
  }) : _ptr = rustCall(
         (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_decay(
           FfiConverterDecayKind.lower(kind),
           Expression.lower(x),
           FfiConverterOptionalExpression.lower(target),
           FfiConverterOptionalDouble32.lower(midpoint),
           FfiConverterOptionalDouble32.lower(scale),
           status,
         ),
         edgeExceptionErrorHandler,
       ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.div({
    required Expression left,
    required Expression right,
    double? byZeroDefault = null,
  }) : _ptr = rustCall(
         (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_div(
           Expression.lower(left),
           Expression.lower(right),
           FfiConverterOptionalDouble32.lower(byZeroDefault),
           status,
         ),
         edgeExceptionErrorHandler,
       ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.exp({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_exp(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.geoDistance({required GeoPoint origin, required String to})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_expression_geo_distance(
              FfiConverterGeoPoint.lower(origin),
              FfiConverterString.lower(to),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.ln({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_ln(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.log10({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_log10(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.mult({required List<Expression> factors})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_mult(
          FfiConverterSequenceExpression.lower(factors),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.negate({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_negate(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.pow({required Expression base, required Expression exponent})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_pow(
          Expression.lower(base),
          Expression.lower(exponent),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.sqrt({required Expression expression})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_sqrt(
          Expression.lower(expression),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.sum({required List<Expression> terms})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_sum(
          FfiConverterSequenceExpression.lower(terms),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  Expression.variable({required String name})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_expression_variable(
          FfiConverterString.lower(name),
          status,
        ),
        null,
      ) {
    _ExpressionFinalizer.attach(this, _ptr, detach: this);
  }
  factory Expression.lift(Pointer<Void> ptr) {
    return Expression._(ptr);
  }
  static Pointer<Void> lower(Expression value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_clone_expression(_ptr, status),
    );
  }

  static int allocationSize(Expression value) {
    return 8;
  }

  static LiftRetVal<Expression> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(Expression.lift(pointer), 8);
  }

  static int write(Expression value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _ExpressionFinalizer.detach(this);
    rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_free_expression(_ptr, status),
    );
  }
}

abstract class EdgeShardInterface {
  int count({required CountRequest request});
  FacetResponse facet({required FacetRequest request});
  List<Group> queryGroups({required GroupRequest request});
  ShardInfo info();
  SearchMatrixResponse searchMatrix({required SearchMatrixRequest request});
  List<ScoredPoint> query({required QueryRequest request});
  List<Record> retrieve({required RetrieveRequest request});
  ScrollResponse scroll({required ScrollRequest request});
  List<ScoredPoint> search({required SearchRequest request});
  EdgeConfig config();
  void flush();
  bool optimize();
  String path();
  void setHnswConfig({required HnswIndexConfig hnswConfig});
  void setOptimizersConfig({required OptimizersConfig optimizers});
  void setVectorHnswConfig({
    required String vectorName,
    required HnswIndexConfig hnswConfig,
  });
  String snapshotManifest();
  void unload();
  void updateFromSnapshot({
    required String snapshotPath,
    String? tmpDir = null,
  });
  void update({required UpdateOperation operation});
}

final _EdgeShardFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall((status) => uniffi_qdrant_edge_ffi_fn_free_edgeshard(ptr, status));
});

class EdgeShard implements EdgeShardInterface {
  late final Pointer<Void> _ptr;
  EdgeShard._(this._ptr) {
    _EdgeShardFinalizer.attach(this, _ptr, detach: this);
  }
  EdgeShard.create({required String path, required EdgeConfig config})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_edgeshard_create(
          FfiConverterString.lower(path),
          FfiConverterEdgeConfig.lower(config),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _EdgeShardFinalizer.attach(this, _ptr, detach: this);
  }
  EdgeShard.load({required String path, required EdgeConfig? config})
    : _ptr = rustCall(
        (status) => uniffi_qdrant_edge_ffi_fn_constructor_edgeshard_load(
          FfiConverterString.lower(path),
          FfiConverterOptionalEdgeConfig.lower(config),
          status,
        ),
        edgeExceptionErrorHandler,
      ) {
    _EdgeShardFinalizer.attach(this, _ptr, detach: this);
  }
  factory EdgeShard.lift(Pointer<Void> ptr) {
    return EdgeShard._(ptr);
  }
  static Pointer<Void> lower(EdgeShard value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_clone_edgeshard(_ptr, status),
    );
  }

  static int allocationSize(EdgeShard value) {
    return 8;
  }

  static LiftRetVal<EdgeShard> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(EdgeShard.lift(pointer), 8);
  }

  static int write(EdgeShard value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _EdgeShardFinalizer.detach(this);
    rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_free_edgeshard(_ptr, status),
    );
  }

  int count({required CountRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_count(
        uniffiClonePointer(),
        FfiConverterCountRequest.lower(request),
        status,
      ),
      FfiConverterUInt64.lift,
      edgeExceptionErrorHandler,
    );
  }

  FacetResponse facet({required FacetRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_facet(
        uniffiClonePointer(),
        FfiConverterFacetRequest.lower(request),
        status,
      ),
      FfiConverterFacetResponse.lift,
      edgeExceptionErrorHandler,
    );
  }

  List<Group> queryGroups({required GroupRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_query_groups(
        uniffiClonePointer(),
        FfiConverterGroupRequest.lower(request),
        status,
      ),
      FfiConverterSequenceGroup.lift,
      edgeExceptionErrorHandler,
    );
  }

  ShardInfo info() {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_info(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterShardInfo.lift,
      edgeExceptionErrorHandler,
    );
  }

  SearchMatrixResponse searchMatrix({required SearchMatrixRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_search_matrix(
        uniffiClonePointer(),
        FfiConverterSearchMatrixRequest.lower(request),
        status,
      ),
      FfiConverterSearchMatrixResponse.lift,
      edgeExceptionErrorHandler,
    );
  }

  List<ScoredPoint> query({required QueryRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_query(
        uniffiClonePointer(),
        FfiConverterQueryRequest.lower(request),
        status,
      ),
      FfiConverterSequenceScoredPoint.lift,
      edgeExceptionErrorHandler,
    );
  }

  List<Record> retrieve({required RetrieveRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_retrieve(
        uniffiClonePointer(),
        FfiConverterRetrieveRequest.lower(request),
        status,
      ),
      FfiConverterSequenceRecord.lift,
      edgeExceptionErrorHandler,
    );
  }

  ScrollResponse scroll({required ScrollRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_scroll(
        uniffiClonePointer(),
        FfiConverterScrollRequest.lower(request),
        status,
      ),
      FfiConverterScrollResponse.lift,
      edgeExceptionErrorHandler,
    );
  }

  List<ScoredPoint> search({required SearchRequest request}) {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_search(
        uniffiClonePointer(),
        FfiConverterSearchRequest.lower(request),
        status,
      ),
      FfiConverterSequenceScoredPoint.lift,
      edgeExceptionErrorHandler,
    );
  }

  EdgeConfig config() {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_config(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterEdgeConfig.lift,
      edgeExceptionErrorHandler,
    );
  }

  void flush() {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_flush(
        uniffiClonePointer(),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  bool optimize() {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_optimize(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterBool.lift,
      edgeExceptionErrorHandler,
    );
  }

  String path() {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_path(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      edgeExceptionErrorHandler,
    );
  }

  void setHnswConfig({required HnswIndexConfig hnswConfig}) {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_hnsw_config(
        uniffiClonePointer(),
        FfiConverterHnswIndexConfig.lower(hnswConfig),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  void setOptimizersConfig({required OptimizersConfig optimizers}) {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_optimizers_config(
        uniffiClonePointer(),
        FfiConverterOptimizersConfig.lower(optimizers),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  void setVectorHnswConfig({
    required String vectorName,
    required HnswIndexConfig hnswConfig,
  }) {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_vector_hnsw_config(
        uniffiClonePointer(),
        FfiConverterString.lower(vectorName),
        FfiConverterHnswIndexConfig.lower(hnswConfig),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  String snapshotManifest() {
    return rustCallWithLifter(
      (status) => uniffi_qdrant_edge_ffi_fn_method_edgeshard_snapshot_manifest(
        uniffiClonePointer(),
        status,
      ),
      FfiConverterString.lift,
      edgeExceptionErrorHandler,
    );
  }

  void unload() {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_unload(
        uniffiClonePointer(),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  void updateFromSnapshot({
    required String snapshotPath,
    String? tmpDir = null,
  }) {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_update_from_snapshot(
        uniffiClonePointer(),
        FfiConverterString.lower(snapshotPath),
        FfiConverterOptionalString.lower(tmpDir),
        status,
      );
    }, edgeExceptionErrorHandler);
  }

  void update({required UpdateOperation operation}) {
    return rustCall((status) {
      uniffi_qdrant_edge_ffi_fn_method_edgeshard_update(
        uniffiClonePointer(),
        UpdateOperation.lower(operation),
        status,
      );
    }, edgeExceptionErrorHandler);
  }
}

abstract class UpdateOperationInterface {}

final _UpdateOperationFinalizer = Finalizer<Pointer<Void>>((ptr) {
  rustCall(
    (status) => uniffi_qdrant_edge_ffi_fn_free_updateoperation(ptr, status),
  );
});

class UpdateOperation implements UpdateOperationInterface {
  late final Pointer<Void> _ptr;
  UpdateOperation._(this._ptr) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.clearPayload({required List<PointId> pointIds})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_clear_payload(
              FfiConverterSequencePointId.lower(pointIds),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.clearPayloadByFilter({required Filter filter})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_clear_payload_by_filter(
              FfiConverterFilter.lower(filter),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.createDenseVector({
    required String vectorName,
    required int size,
    required Distance distance,
    MultiVectorConfig? multivectorConfig = null,
    VectorStorageDatatype? datatype = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_dense_vector(
               FfiConverterString.lower(vectorName),
               FfiConverterUInt64.lower(size),
               FfiConverterDistance.lower(distance),
               FfiConverterOptionalMultiVectorConfig.lower(multivectorConfig),
               FfiConverterOptionalVectorStorageDatatype.lower(datatype),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.createFieldIndex({
    required String fieldName,
    required PayloadSchemaType schema,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_field_index(
               FfiConverterString.lower(fieldName),
               FfiConverterPayloadSchemaType.lower(schema),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.createFieldIndexWithParams({
    required String fieldName,
    required PayloadIndexParams params,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_field_index_with_params(
               FfiConverterString.lower(fieldName),
               FfiConverterPayloadIndexParams.lower(params),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.createSparseVector({
    required String vectorName,
    Modifier? modifier = null,
    VectorStorageDatatype? datatype = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_sparse_vector(
               FfiConverterString.lower(vectorName),
               FfiConverterOptionalModifier.lower(modifier),
               FfiConverterOptionalVectorStorageDatatype.lower(datatype),
               status,
             ),
         null,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deleteFieldIndex({required String fieldName})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_field_index(
              FfiConverterString.lower(fieldName),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deletePayload({
    required List<PointId> pointIds,
    required List<String> keys,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_payload(
               FfiConverterSequencePointId.lower(pointIds),
               FfiConverterSequenceString.lower(keys),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deletePayloadByFilter({
    required Filter filter,
    required List<String> keys,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_payload_by_filter(
               FfiConverterFilter.lower(filter),
               FfiConverterSequenceString.lower(keys),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deletePoints({required List<PointId> pointIds})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_points(
              FfiConverterSequencePointId.lower(pointIds),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deletePointsByFilter({required Filter filter})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_points_by_filter(
              FfiConverterFilter.lower(filter),
              status,
            ),
        edgeExceptionErrorHandler,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deleteVectorName({required String vectorName})
    : _ptr = rustCall(
        (status) =>
            uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vector_name(
              FfiConverterString.lower(vectorName),
              status,
            ),
        null,
      ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deleteVectors({
    required List<PointId> pointIds,
    required List<String> vectorNames,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vectors(
               FfiConverterSequencePointId.lower(pointIds),
               FfiConverterSequenceString.lower(vectorNames),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.deleteVectorsByFilter({
    required Filter filter,
    required List<String> vectorNames,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vectors_by_filter(
               FfiConverterFilter.lower(filter),
               FfiConverterSequenceString.lower(vectorNames),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.overwritePayload({
    required List<PointId> pointIds,
    required String payloadJson,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_overwrite_payload(
               FfiConverterSequencePointId.lower(pointIds),
               FfiConverterString.lower(payloadJson),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.overwritePayloadByFilter({
    required Filter filter,
    required String payloadJson,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_overwrite_payload_by_filter(
               FfiConverterFilter.lower(filter),
               FfiConverterString.lower(payloadJson),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.setPayload({
    required List<PointId> pointIds,
    required String payloadJson,
    String? key = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_set_payload(
               FfiConverterSequencePointId.lower(pointIds),
               FfiConverterString.lower(payloadJson),
               FfiConverterOptionalString.lower(key),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.setPayloadByFilter({
    required Filter filter,
    required String payloadJson,
    String? key = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_set_payload_by_filter(
               FfiConverterFilter.lower(filter),
               FfiConverterString.lower(payloadJson),
               FfiConverterOptionalString.lower(key),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.updateVectors({
    required List<PointVectors> pointVectors,
    Filter? condition = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_update_vectors(
               FfiConverterSequencePointVectors.lower(pointVectors),
               FfiConverterOptionalFilter.lower(condition),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  UpdateOperation.upsertPoints({
    required List<Point> points,
    Filter? condition = null,
    UpdateMode? updateMode = null,
  }) : _ptr = rustCall(
         (status) =>
             uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_upsert_points(
               FfiConverterSequencePoint.lower(points),
               FfiConverterOptionalFilter.lower(condition),
               FfiConverterOptionalUpdateMode.lower(updateMode),
               status,
             ),
         edgeExceptionErrorHandler,
       ) {
    _UpdateOperationFinalizer.attach(this, _ptr, detach: this);
  }
  factory UpdateOperation.lift(Pointer<Void> ptr) {
    return UpdateOperation._(ptr);
  }
  static Pointer<Void> lower(UpdateOperation value) {
    return value.uniffiClonePointer();
  }

  Pointer<Void> uniffiClonePointer() {
    return rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_clone_updateoperation(_ptr, status),
    );
  }

  static int allocationSize(UpdateOperation value) {
    return 8;
  }

  static LiftRetVal<UpdateOperation> read(Uint8List buf) {
    final handle = buf.buffer.asByteData(buf.offsetInBytes).getInt64(0);
    final pointer = Pointer<Void>.fromAddress(handle);
    return LiftRetVal(UpdateOperation.lift(pointer), 8);
  }

  static int write(UpdateOperation value, Uint8List buf) {
    final handle = lower(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, handle.address);
    return 8;
  }

  void dispose() {
    _UpdateOperationFinalizer.detach(this);
    rustCall(
      (status) => uniffi_qdrant_edge_ffi_fn_free_updateoperation(_ptr, status),
    );
  }
}

class UniffiInternalError implements Exception {
  static const int bufferOverflow = 0;
  static const int incompleteData = 1;
  static const int unexpectedOptionalTag = 2;
  static const int unexpectedEnumCase = 3;
  static const int unexpectedNullPointer = 4;
  static const int unexpectedRustCallStatusCode = 5;
  static const int unexpectedRustCallError = 6;
  static const int unexpectedStaleHandle = 7;
  static const int rustPanic = 8;
  final int errorCode;
  final String? panicMessage;
  const UniffiInternalError(this.errorCode, this.panicMessage);
  static UniffiInternalError panicked(String message) {
    return UniffiInternalError(rustPanic, message);
  }

  @override
  String toString() {
    switch (errorCode) {
      case bufferOverflow:
        return "UniFfi::BufferOverflow";
      case incompleteData:
        return "UniFfi::IncompleteData";
      case unexpectedOptionalTag:
        return "UniFfi::UnexpectedOptionalTag";
      case unexpectedEnumCase:
        return "UniFfi::UnexpectedEnumCase";
      case unexpectedNullPointer:
        return "UniFfi::UnexpectedNullPointer";
      case unexpectedRustCallStatusCode:
        return "UniFfi::UnexpectedRustCallStatusCode";
      case unexpectedRustCallError:
        return "UniFfi::UnexpectedRustCallError";
      case unexpectedStaleHandle:
        return "UniFfi::UnexpectedStaleHandle";
      case rustPanic:
        return "UniFfi::rustPanic: $panicMessage";
      default:
        return "UniFfi::UnknownError: $errorCode";
    }
  }
}

const int CALL_SUCCESS = 0;
const int CALL_ERROR = 1;
const int CALL_UNEXPECTED_ERROR = 2;

final class RustCallStatus extends Struct {
  @Int8()
  external int code;
  external RustBuffer errorBuf;
}

void checkCallStatus(
  UniffiRustCallStatusErrorHandler errorHandler,
  Pointer<RustCallStatus> status,
) {
  if (status.ref.code == CALL_SUCCESS) {
    return;
  } else if (status.ref.code == CALL_ERROR) {
    throw errorHandler.lift(status.ref.errorBuf);
  } else if (status.ref.code == CALL_UNEXPECTED_ERROR) {
    if (status.ref.errorBuf.len > 0) {
      throw UniffiInternalError.panicked(
        FfiConverterString.lift(status.ref.errorBuf),
      );
    } else {
      throw UniffiInternalError.panicked("Rust panic");
    }
  } else {
    throw UniffiInternalError.panicked(
      "Unexpected RustCallStatus code: \${status.ref.code}",
    );
  }
}

T rustCall<T>(
  T Function(Pointer<RustCallStatus>) callback, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) {
  final status = calloc<RustCallStatus>();
  try {
    final result = callback(status);
    checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
    return result;
  } finally {
    calloc.free(status);
  }
}

T rustCallWithLifter<T, F>(
  F Function(Pointer<RustCallStatus>) ffiCall,
  T Function(F) lifter, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) {
  final status = calloc<RustCallStatus>();
  try {
    final rawResult = ffiCall(status);
    checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
    return lifter(rawResult);
  } finally {
    calloc.free(status);
  }
}

class NullRustCallStatusErrorHandler extends UniffiRustCallStatusErrorHandler {
  @override
  Exception lift(RustBuffer errorBuf) {
    errorBuf.free();
    return UniffiInternalError.panicked("Unexpected CALL_ERROR");
  }
}

abstract class UniffiRustCallStatusErrorHandler {
  Exception lift(RustBuffer errorBuf);
}

final class RustBuffer extends Struct {
  @Uint64()
  external int capacity;
  @Uint64()
  external int len;
  external Pointer<Uint8> data;
  static RustBuffer alloc(int size) {
    return rustCall(
      (status) => ffi_qdrant_edge_ffi_rustbuffer_alloc(size, status),
    );
  }

  static RustBuffer fromBytes(ForeignBytes bytes) {
    return rustCall(
      (status) => ffi_qdrant_edge_ffi_rustbuffer_from_bytes(bytes, status),
    );
  }

  void free() {
    rustCall((status) => ffi_qdrant_edge_ffi_rustbuffer_free(this, status));
  }

  RustBuffer reserve(int additionalCapacity) {
    return rustCall(
      (status) => ffi_qdrant_edge_ffi_rustbuffer_reserve(
        this,
        additionalCapacity,
        status,
      ),
    );
  }

  Uint8List asUint8List() {
    final dataList = data.asTypedList(len);
    final byteData = ByteData.sublistView(dataList);
    return Uint8List.view(byteData.buffer);
  }

  @override
  String toString() {
    return "RustBuffer{capacity: \$capacity, len: \$len, data: \$data}";
  }
}

RustBuffer toRustBuffer(Uint8List data) {
  final length = data.length;
  final Pointer<Uint8> frameData = calloc<Uint8>(length);
  final pointerList = frameData.asTypedList(length);
  pointerList.setAll(0, data);
  final bytes = calloc<ForeignBytes>();
  bytes.ref.len = length;
  bytes.ref.data = frameData;
  return RustBuffer.fromBytes(bytes.ref);
}

final class ForeignBytes extends Struct {
  @Int32()
  external int len;
  external Pointer<Uint8> data;
  void free() {
    calloc.free(data);
  }
}

class LiftRetVal<T> {
  final T value;
  final int bytesRead;
  const LiftRetVal(this.value, this.bytesRead);
  LiftRetVal<T> copyWithOffset(int offset) {
    return LiftRetVal(value, bytesRead + offset);
  }
}

abstract class FfiConverter<D, F> {
  const FfiConverter();
  D lift(F value);
  F lower(D value);
  D read(ByteData buffer, int offset);
  void write(D value, ByteData buffer, int offset);
  int size(D value);
}

mixin FfiConverterPrimitive<T> on FfiConverter<T, T> {
  @override
  T lift(T value) => value;
  @override
  T lower(T value) => value;
}

Uint8List createUint8ListFromInt(int value) {
  int length = value.bitLength ~/ 8 + 1;
  if (length != 4 && length != 8) {
    length = (value < 0x100000000) ? 4 : 8;
  }
  Uint8List uint8List = Uint8List(length);
  for (int i = length - 1; i >= 0; i--) {
    uint8List[i] = value & 0xFF;
    value >>= 8;
  }
  return uint8List;
}

class FfiConverterBool {
  static bool lift(int value) {
    return value == 1;
  }

  static int lower(bool value) {
    return value ? 1 : 0;
  }

  static LiftRetVal<bool> read(Uint8List buf) {
    return LiftRetVal(FfiConverterBool.lift(buf.first), 1);
  }

  static RustBuffer lowerIntoRustBuffer(bool value) {
    return toRustBuffer(Uint8List.fromList([FfiConverterBool.lower(value)]));
  }

  static int allocationSize([bool value = false]) {
    return 1;
  }

  static int write(bool value, Uint8List buf) {
    buf.setAll(0, [value ? 1 : 0]);
    return allocationSize();
  }
}

class FfiConverterDouble32 {
  static double lift(double value) => value;
  static LiftRetVal<double> read(Uint8List buf) {
    return LiftRetVal(
      buf.buffer.asByteData(buf.offsetInBytes).getFloat32(0),
      4,
    );
  }

  static double lower(double value) => value;
  static int allocationSize([double value = 0]) {
    return 4;
  }

  static int write(double value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setFloat32(0, value);
    return FfiConverterDouble32.allocationSize();
  }
}

class FfiConverterDouble64 {
  static double lift(double value) => value;
  static LiftRetVal<double> read(Uint8List buf) {
    return LiftRetVal(
      buf.buffer.asByteData(buf.offsetInBytes).getFloat64(0),
      8,
    );
  }

  static double lower(double value) => value;
  static int allocationSize([double value = 0]) {
    return 8;
  }

  static int write(double value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setFloat64(0, value);
    return FfiConverterDouble64.allocationSize();
  }
}

class FfiConverterInt64 {
  static int lift(int value) => value;
  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getInt64(0), 8);
  }

  static int lower(int value) {
    if (value < -9223372036854775808 || value > 9223372036854775807) {
      throw ArgumentError("Value out of range for i64: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 8;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt64(0, lower(value));
    return 8;
  }
}

class FfiConverterMapStringToNamedVector {
  static Map<String, NamedVector> lift(RustBuffer buf) {
    return FfiConverterMapStringToNamedVector.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Map<String, NamedVector>> read(Uint8List buf) {
    final map = <String, NamedVector>{};
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final k = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += k.bytesRead;
      final v = FfiConverterNamedVector.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += v.bytesRead;
      map[k.value] = v.value;
    }
    return LiftRetVal(map, offset - buf.offsetInBytes);
  }

  static int write(Map<String, NamedVector> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (final entry in value.entries) {
      offset += FfiConverterString.write(
        entry.key,
        Uint8List.view(buf.buffer, offset),
      );
      offset += FfiConverterNamedVector.write(
        entry.value,
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(Map<String, NamedVector> value) {
    return value.entries
        .map(
          (e) =>
              FfiConverterString.allocationSize(e.key) +
              FfiConverterNamedVector.allocationSize(e.value),
        )
        .fold(4, (a, b) => a + b);
  }

  static RustBuffer lower(Map<String, NamedVector> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterMapStringToPayloadIndexInfo {
  static Map<String, PayloadIndexInfo> lift(RustBuffer buf) {
    return FfiConverterMapStringToPayloadIndexInfo.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<Map<String, PayloadIndexInfo>> read(Uint8List buf) {
    final map = <String, PayloadIndexInfo>{};
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final k = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += k.bytesRead;
      final v = FfiConverterPayloadIndexInfo.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += v.bytesRead;
      map[k.value] = v.value;
    }
    return LiftRetVal(map, offset - buf.offsetInBytes);
  }

  static int write(Map<String, PayloadIndexInfo> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (final entry in value.entries) {
      offset += FfiConverterString.write(
        entry.key,
        Uint8List.view(buf.buffer, offset),
      );
      offset += FfiConverterPayloadIndexInfo.write(
        entry.value,
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(Map<String, PayloadIndexInfo> value) {
    return value.entries
        .map(
          (e) =>
              FfiConverterString.allocationSize(e.key) +
              FfiConverterPayloadIndexInfo.allocationSize(e.value),
        )
        .fold(4, (a, b) => a + b);
  }

  static RustBuffer lower(Map<String, PayloadIndexInfo> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterMapStringToSparseVectorDataConfig {
  static Map<String, SparseVectorDataConfig> lift(RustBuffer buf) {
    return FfiConverterMapStringToSparseVectorDataConfig.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<Map<String, SparseVectorDataConfig>> read(Uint8List buf) {
    final map = <String, SparseVectorDataConfig>{};
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final k = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += k.bytesRead;
      final v = FfiConverterSparseVectorDataConfig.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += v.bytesRead;
      map[k.value] = v.value;
    }
    return LiftRetVal(map, offset - buf.offsetInBytes);
  }

  static int write(Map<String, SparseVectorDataConfig> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (final entry in value.entries) {
      offset += FfiConverterString.write(
        entry.key,
        Uint8List.view(buf.buffer, offset),
      );
      offset += FfiConverterSparseVectorDataConfig.write(
        entry.value,
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(Map<String, SparseVectorDataConfig> value) {
    return value.entries
        .map(
          (e) =>
              FfiConverterString.allocationSize(e.key) +
              FfiConverterSparseVectorDataConfig.allocationSize(e.value),
        )
        .fold(4, (a, b) => a + b);
  }

  static RustBuffer lower(Map<String, SparseVectorDataConfig> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterMapStringToString {
  static Map<String, String> lift(RustBuffer buf) {
    return FfiConverterMapStringToString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Map<String, String>> read(Uint8List buf) {
    final map = <String, String>{};
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final k = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += k.bytesRead;
      final v = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += v.bytesRead;
      map[k.value] = v.value;
    }
    return LiftRetVal(map, offset - buf.offsetInBytes);
  }

  static int write(Map<String, String> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (final entry in value.entries) {
      offset += FfiConverterString.write(
        entry.key,
        Uint8List.view(buf.buffer, offset),
      );
      offset += FfiConverterString.write(
        entry.value,
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(Map<String, String> value) {
    return value.entries
        .map(
          (e) =>
              FfiConverterString.allocationSize(e.key) +
              FfiConverterString.allocationSize(e.value),
        )
        .fold(4, (a, b) => a + b);
  }

  static RustBuffer lower(Map<String, String> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterMapStringToVectorDataConfig {
  static Map<String, VectorDataConfig> lift(RustBuffer buf) {
    return FfiConverterMapStringToVectorDataConfig.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<Map<String, VectorDataConfig>> read(Uint8List buf) {
    final map = <String, VectorDataConfig>{};
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final k = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += k.bytesRead;
      final v = FfiConverterVectorDataConfig.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += v.bytesRead;
      map[k.value] = v.value;
    }
    return LiftRetVal(map, offset - buf.offsetInBytes);
  }

  static int write(Map<String, VectorDataConfig> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (final entry in value.entries) {
      offset += FfiConverterString.write(
        entry.key,
        Uint8List.view(buf.buffer, offset),
      );
      offset += FfiConverterVectorDataConfig.write(
        entry.value,
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(Map<String, VectorDataConfig> value) {
    return value.entries
        .map(
          (e) =>
              FfiConverterString.allocationSize(e.key) +
              FfiConverterVectorDataConfig.allocationSize(e.value),
        )
        .fold(4, (a, b) => a + b);
  }

  static RustBuffer lower(Map<String, VectorDataConfig> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterOptionalBinaryQuantizationEncoding {
  static BinaryQuantizationEncoding? lift(RustBuffer buf) {
    return FfiConverterOptionalBinaryQuantizationEncoding.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<BinaryQuantizationEncoding?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterBinaryQuantizationEncoding.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<BinaryQuantizationEncoding?>(
      result.value,
      result.bytesRead + 1,
    );
  }

  static int allocationSize([BinaryQuantizationEncoding? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterBinaryQuantizationEncoding.allocationSize(value) + 1;
  }

  static RustBuffer lower(BinaryQuantizationEncoding? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length =
        FfiConverterOptionalBinaryQuantizationEncoding.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalBinaryQuantizationEncoding.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(BinaryQuantizationEncoding? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterBinaryQuantizationEncoding.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalBinaryQuantizationQueryEncoding {
  static BinaryQuantizationQueryEncoding? lift(RustBuffer buf) {
    return FfiConverterOptionalBinaryQuantizationQueryEncoding.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<BinaryQuantizationQueryEncoding?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterBinaryQuantizationQueryEncoding.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<BinaryQuantizationQueryEncoding?>(
      result.value,
      result.bytesRead + 1,
    );
  }

  static int allocationSize([BinaryQuantizationQueryEncoding? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterBinaryQuantizationQueryEncoding.allocationSize(value) +
        1;
  }

  static RustBuffer lower(BinaryQuantizationQueryEncoding? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length =
        FfiConverterOptionalBinaryQuantizationQueryEncoding.allocationSize(
          value,
        );
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalBinaryQuantizationQueryEncoding.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(BinaryQuantizationQueryEncoding? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterBinaryQuantizationQueryEncoding.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalBool {
  static bool? lift(RustBuffer buf) {
    return FfiConverterOptionalBool.read(buf.asUint8List()).value;
  }

  static LiftRetVal<bool?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterBool.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<bool?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([bool? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterBool.allocationSize(value) + 1;
  }

  static RustBuffer lower(bool? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalBool.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalBool.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(bool? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterBool.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalDirection {
  static Direction? lift(RustBuffer buf) {
    return FfiConverterOptionalDirection.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Direction?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterDirection.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Direction?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Direction? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterDirection.allocationSize(value) + 1;
  }

  static RustBuffer lower(Direction? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalDirection.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalDirection.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Direction? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterDirection.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalDouble32 {
  static double? lift(RustBuffer buf) {
    return FfiConverterOptionalDouble32.read(buf.asUint8List()).value;
  }

  static LiftRetVal<double?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterDouble32.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<double?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([double? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterDouble32.allocationSize(value) + 1;
  }

  static RustBuffer lower(double? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalDouble32.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalDouble32.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(double? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterDouble32.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalDouble64 {
  static double? lift(RustBuffer buf) {
    return FfiConverterOptionalDouble64.read(buf.asUint8List()).value;
  }

  static LiftRetVal<double?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterDouble64.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<double?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([double? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterDouble64.allocationSize(value) + 1;
  }

  static RustBuffer lower(double? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalDouble64.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalDouble64.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(double? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterDouble64.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalEdgeConfig {
  static EdgeConfig? lift(RustBuffer buf) {
    return FfiConverterOptionalEdgeConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<EdgeConfig?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterEdgeConfig.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<EdgeConfig?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([EdgeConfig? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterEdgeConfig.allocationSize(value) + 1;
  }

  static RustBuffer lower(EdgeConfig? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalEdgeConfig.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalEdgeConfig.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(EdgeConfig? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterEdgeConfig.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalExpression {
  static Expression? lift(RustBuffer buf) {
    return FfiConverterOptionalExpression.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Expression?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = Expression.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Expression?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Expression? value]) {
    if (value == null) {
      return 1;
    }
    return Expression.allocationSize(value) + 1;
  }

  static RustBuffer lower(Expression? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalExpression.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalExpression.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Expression? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return Expression.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalFilter {
  static Filter? lift(RustBuffer buf) {
    return FfiConverterOptionalFilter.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Filter?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterFilter.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Filter?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Filter? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterFilter.allocationSize(value) + 1;
  }

  static RustBuffer lower(Filter? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalFilter.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalFilter.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Filter? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterFilter.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalGeoBoundingBox {
  static GeoBoundingBox? lift(RustBuffer buf) {
    return FfiConverterOptionalGeoBoundingBox.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoBoundingBox?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterGeoBoundingBox.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<GeoBoundingBox?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([GeoBoundingBox? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterGeoBoundingBox.allocationSize(value) + 1;
  }

  static RustBuffer lower(GeoBoundingBox? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalGeoBoundingBox.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalGeoBoundingBox.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(GeoBoundingBox? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterGeoBoundingBox.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalGeoPolygon {
  static GeoPolygon? lift(RustBuffer buf) {
    return FfiConverterOptionalGeoPolygon.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoPolygon?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterGeoPolygon.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<GeoPolygon?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([GeoPolygon? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterGeoPolygon.allocationSize(value) + 1;
  }

  static RustBuffer lower(GeoPolygon? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalGeoPolygon.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalGeoPolygon.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(GeoPolygon? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterGeoPolygon.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalGeoRadius {
  static GeoRadius? lift(RustBuffer buf) {
    return FfiConverterOptionalGeoRadius.read(buf.asUint8List()).value;
  }

  static LiftRetVal<GeoRadius?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterGeoRadius.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<GeoRadius?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([GeoRadius? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterGeoRadius.allocationSize(value) + 1;
  }

  static RustBuffer lower(GeoRadius? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalGeoRadius.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalGeoRadius.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(GeoRadius? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterGeoRadius.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalHnswIndexConfig {
  static HnswIndexConfig? lift(RustBuffer buf) {
    return FfiConverterOptionalHnswIndexConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<HnswIndexConfig?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterHnswIndexConfig.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<HnswIndexConfig?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([HnswIndexConfig? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterHnswIndexConfig.allocationSize(value) + 1;
  }

  static RustBuffer lower(HnswIndexConfig? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalHnswIndexConfig.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalHnswIndexConfig.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(HnswIndexConfig? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterHnswIndexConfig.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalMatch {
  static Match? lift(RustBuffer buf) {
    return FfiConverterOptionalMatch.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Match?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterMatch.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Match?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Match? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterMatch.allocationSize(value) + 1;
  }

  static RustBuffer lower(Match? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalMatch.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalMatch.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Match? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterMatch.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalMemory {
  static Memory? lift(RustBuffer buf) {
    return FfiConverterOptionalMemory.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Memory?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterMemory.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Memory?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Memory? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterMemory.allocationSize(value) + 1;
  }

  static RustBuffer lower(Memory? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalMemory.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalMemory.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Memory? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterMemory.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalMinShould {
  static MinShould? lift(RustBuffer buf) {
    return FfiConverterOptionalMinShould.read(buf.asUint8List()).value;
  }

  static LiftRetVal<MinShould?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterMinShould.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<MinShould?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([MinShould? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterMinShould.allocationSize(value) + 1;
  }

  static RustBuffer lower(MinShould? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalMinShould.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalMinShould.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(MinShould? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterMinShould.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalModifier {
  static Modifier? lift(RustBuffer buf) {
    return FfiConverterOptionalModifier.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Modifier?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterModifier.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Modifier?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Modifier? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterModifier.allocationSize(value) + 1;
  }

  static RustBuffer lower(Modifier? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalModifier.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalModifier.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Modifier? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterModifier.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalMultiVectorConfig {
  static MultiVectorConfig? lift(RustBuffer buf) {
    return FfiConverterOptionalMultiVectorConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<MultiVectorConfig?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterMultiVectorConfig.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<MultiVectorConfig?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([MultiVectorConfig? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterMultiVectorConfig.allocationSize(value) + 1;
  }

  static RustBuffer lower(MultiVectorConfig? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalMultiVectorConfig.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalMultiVectorConfig.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(MultiVectorConfig? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterMultiVectorConfig.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalOrderBy {
  static OrderBy? lift(RustBuffer buf) {
    return FfiConverterOptionalOrderBy.read(buf.asUint8List()).value;
  }

  static LiftRetVal<OrderBy?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterOrderBy.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<OrderBy?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([OrderBy? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterOrderBy.allocationSize(value) + 1;
  }

  static RustBuffer lower(OrderBy? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalOrderBy.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalOrderBy.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(OrderBy? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterOrderBy.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalOrderValue {
  static OrderValue? lift(RustBuffer buf) {
    return FfiConverterOptionalOrderValue.read(buf.asUint8List()).value;
  }

  static LiftRetVal<OrderValue?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterOrderValue.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<OrderValue?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([OrderValue? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterOrderValue.allocationSize(value) + 1;
  }

  static RustBuffer lower(OrderValue? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalOrderValue.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalOrderValue.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(OrderValue? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterOrderValue.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalPayloadIndexParams {
  static PayloadIndexParams? lift(RustBuffer buf) {
    return FfiConverterOptionalPayloadIndexParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<PayloadIndexParams?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterPayloadIndexParams.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<PayloadIndexParams?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([PayloadIndexParams? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterPayloadIndexParams.allocationSize(value) + 1;
  }

  static RustBuffer lower(PayloadIndexParams? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalPayloadIndexParams.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalPayloadIndexParams.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(PayloadIndexParams? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterPayloadIndexParams.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalPointId {
  static PointId? lift(RustBuffer buf) {
    return FfiConverterOptionalPointId.read(buf.asUint8List()).value;
  }

  static LiftRetVal<PointId?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterPointId.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<PointId?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([PointId? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterPointId.allocationSize(value) + 1;
  }

  static RustBuffer lower(PointId? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalPointId.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalPointId.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(PointId? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterPointId.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalQuantizationConfig {
  static QuantizationConfig? lift(RustBuffer buf) {
    return FfiConverterOptionalQuantizationConfig.read(buf.asUint8List()).value;
  }

  static LiftRetVal<QuantizationConfig?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterQuantizationConfig.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<QuantizationConfig?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([QuantizationConfig? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterQuantizationConfig.allocationSize(value) + 1;
  }

  static RustBuffer lower(QuantizationConfig? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalQuantizationConfig.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalQuantizationConfig.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(QuantizationConfig? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterQuantizationConfig.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalRangeDatetime {
  static RangeDatetime? lift(RustBuffer buf) {
    return FfiConverterOptionalRangeDatetime.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RangeDatetime?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterRangeDatetime.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<RangeDatetime?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([RangeDatetime? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterRangeDatetime.allocationSize(value) + 1;
  }

  static RustBuffer lower(RangeDatetime? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalRangeDatetime.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalRangeDatetime.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(RangeDatetime? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterRangeDatetime.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalRangeFloat {
  static RangeFloat? lift(RustBuffer buf) {
    return FfiConverterOptionalRangeFloat.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RangeFloat?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterRangeFloat.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<RangeFloat?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([RangeFloat? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterRangeFloat.allocationSize(value) + 1;
  }

  static RustBuffer lower(RangeFloat? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalRangeFloat.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalRangeFloat.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(RangeFloat? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterRangeFloat.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalRecommendStrategy {
  static RecommendStrategy? lift(RustBuffer buf) {
    return FfiConverterOptionalRecommendStrategy.read(buf.asUint8List()).value;
  }

  static LiftRetVal<RecommendStrategy?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterRecommendStrategy.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<RecommendStrategy?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([RecommendStrategy? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterRecommendStrategy.allocationSize(value) + 1;
  }

  static RustBuffer lower(RecommendStrategy? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalRecommendStrategy.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalRecommendStrategy.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(RecommendStrategy? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterRecommendStrategy.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalScoringQuery {
  static ScoringQuery? lift(RustBuffer buf) {
    return FfiConverterOptionalScoringQuery.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ScoringQuery?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterScoringQuery.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<ScoringQuery?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([ScoringQuery? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterScoringQuery.allocationSize(value) + 1;
  }

  static RustBuffer lower(ScoringQuery? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalScoringQuery.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalScoringQuery.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(ScoringQuery? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterScoringQuery.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSearchParams {
  static SearchParams? lift(RustBuffer buf) {
    return FfiConverterOptionalSearchParams.read(buf.asUint8List()).value;
  }

  static LiftRetVal<SearchParams?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSearchParams.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<SearchParams?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([SearchParams? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSearchParams.allocationSize(value) + 1;
  }

  static RustBuffer lower(SearchParams? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSearchParams.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSearchParams.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(SearchParams? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSearchParams.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSequenceCondition {
  static List<Condition>? lift(RustBuffer buf) {
    return FfiConverterOptionalSequenceCondition.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Condition>?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSequenceCondition.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<List<Condition>?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([List<Condition>? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSequenceCondition.allocationSize(value) + 1;
  }

  static RustBuffer lower(List<Condition>? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSequenceCondition.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSequenceCondition.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(List<Condition>? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSequenceCondition.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSequenceDouble32 {
  static List<double>? lift(RustBuffer buf) {
    return FfiConverterOptionalSequenceDouble32.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<double>?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSequenceDouble32.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<List<double>?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([List<double>? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSequenceDouble32.allocationSize(value) + 1;
  }

  static RustBuffer lower(List<double>? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSequenceDouble32.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSequenceDouble32.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(List<double>? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSequenceDouble32.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSequenceGeoLineString {
  static List<GeoLineString>? lift(RustBuffer buf) {
    return FfiConverterOptionalSequenceGeoLineString.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<List<GeoLineString>?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSequenceGeoLineString.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<List<GeoLineString>?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([List<GeoLineString>? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSequenceGeoLineString.allocationSize(value) + 1;
  }

  static RustBuffer lower(List<GeoLineString>? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSequenceGeoLineString.allocationSize(
      value,
    );
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSequenceGeoLineString.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(List<GeoLineString>? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSequenceGeoLineString.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSequenceLanguage {
  static List<Language>? lift(RustBuffer buf) {
    return FfiConverterOptionalSequenceLanguage.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Language>?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSequenceLanguage.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<List<Language>?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([List<Language>? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSequenceLanguage.allocationSize(value) + 1;
  }

  static RustBuffer lower(List<Language>? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSequenceLanguage.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSequenceLanguage.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(List<Language>? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSequenceLanguage.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalSequenceString {
  static List<String>? lift(RustBuffer buf) {
    return FfiConverterOptionalSequenceString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<String>?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterSequenceString.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<List<String>?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([List<String>? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterSequenceString.allocationSize(value) + 1;
  }

  static RustBuffer lower(List<String>? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalSequenceString.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalSequenceString.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(List<String>? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterSequenceString.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalStartFrom {
  static StartFrom? lift(RustBuffer buf) {
    return FfiConverterOptionalStartFrom.read(buf.asUint8List()).value;
  }

  static LiftRetVal<StartFrom?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterStartFrom.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<StartFrom?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([StartFrom? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterStartFrom.allocationSize(value) + 1;
  }

  static RustBuffer lower(StartFrom? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalStartFrom.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalStartFrom.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(StartFrom? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterStartFrom.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalStemmer {
  static Stemmer? lift(RustBuffer buf) {
    return FfiConverterOptionalStemmer.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Stemmer?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterStemmer.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Stemmer?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Stemmer? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterStemmer.allocationSize(value) + 1;
  }

  static RustBuffer lower(Stemmer? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalStemmer.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalStemmer.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Stemmer? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterStemmer.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalStopwords {
  static Stopwords? lift(RustBuffer buf) {
    return FfiConverterOptionalStopwords.read(buf.asUint8List()).value;
  }

  static LiftRetVal<Stopwords?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterStopwords.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<Stopwords?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([Stopwords? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterStopwords.allocationSize(value) + 1;
  }

  static RustBuffer lower(Stopwords? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalStopwords.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalStopwords.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(Stopwords? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterStopwords.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalString {
  static String? lift(RustBuffer buf) {
    return FfiConverterOptionalString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<String?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterString.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<String?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([String? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterString.allocationSize(value) + 1;
  }

  static RustBuffer lower(String? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalString.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalString.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(String? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterString.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalTokenizerType {
  static TokenizerType? lift(RustBuffer buf) {
    return FfiConverterOptionalTokenizerType.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TokenizerType?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterTokenizerType.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<TokenizerType?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([TokenizerType? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterTokenizerType.allocationSize(value) + 1;
  }

  static RustBuffer lower(TokenizerType? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalTokenizerType.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalTokenizerType.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(TokenizerType? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterTokenizerType.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalTurboQuantBitSize {
  static TurboQuantBitSize? lift(RustBuffer buf) {
    return FfiConverterOptionalTurboQuantBitSize.read(buf.asUint8List()).value;
  }

  static LiftRetVal<TurboQuantBitSize?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterTurboQuantBitSize.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<TurboQuantBitSize?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([TurboQuantBitSize? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterTurboQuantBitSize.allocationSize(value) + 1;
  }

  static RustBuffer lower(TurboQuantBitSize? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalTurboQuantBitSize.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalTurboQuantBitSize.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(TurboQuantBitSize? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterTurboQuantBitSize.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalUInt64 {
  static int? lift(RustBuffer buf) {
    return FfiConverterOptionalUInt64.read(buf.asUint8List()).value;
  }

  static LiftRetVal<int?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterUInt64.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<int?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([int? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterUInt64.allocationSize(value) + 1;
  }

  static RustBuffer lower(int? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalUInt64.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalUInt64.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(int? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterUInt64.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalUpdateMode {
  static UpdateMode? lift(RustBuffer buf) {
    return FfiConverterOptionalUpdateMode.read(buf.asUint8List()).value;
  }

  static LiftRetVal<UpdateMode?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterUpdateMode.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<UpdateMode?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([UpdateMode? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterUpdateMode.allocationSize(value) + 1;
  }

  static RustBuffer lower(UpdateMode? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalUpdateMode.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalUpdateMode.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(UpdateMode? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterUpdateMode.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalValuesCount {
  static ValuesCount? lift(RustBuffer buf) {
    return FfiConverterOptionalValuesCount.read(buf.asUint8List()).value;
  }

  static LiftRetVal<ValuesCount?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterValuesCount.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<ValuesCount?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([ValuesCount? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterValuesCount.allocationSize(value) + 1;
  }

  static RustBuffer lower(ValuesCount? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalValuesCount.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalValuesCount.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(ValuesCount? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterValuesCount.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalVectorStorageDatatype {
  static VectorStorageDatatype? lift(RustBuffer buf) {
    return FfiConverterOptionalVectorStorageDatatype.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<VectorStorageDatatype?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterVectorStorageDatatype.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<VectorStorageDatatype?>(
      result.value,
      result.bytesRead + 1,
    );
  }

  static int allocationSize([VectorStorageDatatype? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterVectorStorageDatatype.allocationSize(value) + 1;
  }

  static RustBuffer lower(VectorStorageDatatype? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalVectorStorageDatatype.allocationSize(
      value,
    );
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalVectorStorageDatatype.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(VectorStorageDatatype? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterVectorStorageDatatype.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalWithPayload {
  static WithPayload? lift(RustBuffer buf) {
    return FfiConverterOptionalWithPayload.read(buf.asUint8List()).value;
  }

  static LiftRetVal<WithPayload?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterWithPayload.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<WithPayload?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([WithPayload? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterWithPayload.allocationSize(value) + 1;
  }

  static RustBuffer lower(WithPayload? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalWithPayload.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalWithPayload.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(WithPayload? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterWithPayload.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterOptionalWithVector {
  static WithVector? lift(RustBuffer buf) {
    return FfiConverterOptionalWithVector.read(buf.asUint8List()).value;
  }

  static LiftRetVal<WithVector?> read(Uint8List buf) {
    if (ByteData.view(buf.buffer, buf.offsetInBytes).getInt8(0) == 0) {
      return LiftRetVal(null, 1);
    }
    final result = FfiConverterWithVector.read(
      Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
    );
    return LiftRetVal<WithVector?>(result.value, result.bytesRead + 1);
  }

  static int allocationSize([WithVector? value]) {
    if (value == null) {
      return 1;
    }
    return FfiConverterWithVector.allocationSize(value) + 1;
  }

  static RustBuffer lower(WithVector? value) {
    if (value == null) {
      return toRustBuffer(Uint8List.fromList([0]));
    }
    final length = FfiConverterOptionalWithVector.allocationSize(value);
    final Pointer<Uint8> frameData = calloc<Uint8>(length);
    final buf = frameData.asTypedList(length);
    FfiConverterOptionalWithVector.write(value, buf);
    final bytes = calloc<ForeignBytes>();
    bytes.ref.len = length;
    bytes.ref.data = frameData;
    return RustBuffer.fromBytes(bytes.ref);
  }

  static int write(WithVector? value, Uint8List buf) {
    if (value == null) {
      buf[0] = 0;
      return 1;
    }
    buf[0] = 1;
    return FfiConverterWithVector.write(
          value,
          Uint8List.view(buf.buffer, buf.offsetInBytes + 1),
        ) +
        1;
  }
}

class FfiConverterSequenceCondition {
  static List<Condition> lift(RustBuffer buf) {
    return FfiConverterSequenceCondition.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Condition>> read(Uint8List buf) {
    List<Condition> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterCondition.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Condition> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterCondition.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Condition> value) {
    return value
            .map((l) => FfiConverterCondition.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Condition> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceContextPair {
  static List<ContextPair> lift(RustBuffer buf) {
    return FfiConverterSequenceContextPair.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<ContextPair>> read(Uint8List buf) {
    List<ContextPair> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterContextPair.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<ContextPair> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterContextPair.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<ContextPair> value) {
    return value
            .map((l) => FfiConverterContextPair.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<ContextPair> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceDouble32 {
  static List<double> lift(RustBuffer buf) {
    return FfiConverterSequenceDouble32.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<double>> read(Uint8List buf) {
    List<double> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterDouble32.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<double> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterDouble32.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<double> value) {
    return value
            .map((l) => FfiConverterDouble32.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<double> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceExpression {
  static List<Expression> lift(RustBuffer buf) {
    return FfiConverterSequenceExpression.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Expression>> read(Uint8List buf) {
    List<Expression> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = Expression.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Expression> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += Expression.write(value[i], Uint8List.view(buf.buffer, offset));
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Expression> value) {
    return value
            .map((l) => Expression.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Expression> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceFacetHit {
  static List<FacetHit> lift(RustBuffer buf) {
    return FfiConverterSequenceFacetHit.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<FacetHit>> read(Uint8List buf) {
    List<FacetHit> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterFacetHit.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<FacetHit> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterFacetHit.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<FacetHit> value) {
    return value
            .map((l) => FfiConverterFacetHit.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<FacetHit> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceFeedbackItem {
  static List<FeedbackItem> lift(RustBuffer buf) {
    return FfiConverterSequenceFeedbackItem.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<FeedbackItem>> read(Uint8List buf) {
    List<FeedbackItem> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterFeedbackItem.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<FeedbackItem> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterFeedbackItem.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<FeedbackItem> value) {
    return value
            .map((l) => FfiConverterFeedbackItem.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<FeedbackItem> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceGeoLineString {
  static List<GeoLineString> lift(RustBuffer buf) {
    return FfiConverterSequenceGeoLineString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<GeoLineString>> read(Uint8List buf) {
    List<GeoLineString> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterGeoLineString.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<GeoLineString> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterGeoLineString.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<GeoLineString> value) {
    return value
            .map((l) => FfiConverterGeoLineString.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<GeoLineString> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceGeoPoint {
  static List<GeoPoint> lift(RustBuffer buf) {
    return FfiConverterSequenceGeoPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<GeoPoint>> read(Uint8List buf) {
    List<GeoPoint> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterGeoPoint.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<GeoPoint> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterGeoPoint.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<GeoPoint> value) {
    return value
            .map((l) => FfiConverterGeoPoint.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<GeoPoint> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceGroup {
  static List<Group> lift(RustBuffer buf) {
    return FfiConverterSequenceGroup.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Group>> read(Uint8List buf) {
    List<Group> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterGroup.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Group> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterGroup.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Group> value) {
    return value
            .map((l) => FfiConverterGroup.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Group> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceInt64 {
  static List<int> lift(RustBuffer buf) {
    return FfiConverterSequenceInt64.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<int>> read(Uint8List buf) {
    List<int> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterInt64.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<int> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterInt64.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<int> value) {
    return value
            .map((l) => FfiConverterInt64.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<int> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceLanguage {
  static List<Language> lift(RustBuffer buf) {
    return FfiConverterSequenceLanguage.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Language>> read(Uint8List buf) {
    List<Language> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterLanguage.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Language> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterLanguage.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Language> value) {
    return value
            .map((l) => FfiConverterLanguage.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Language> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceNamedVector {
  static List<NamedVector> lift(RustBuffer buf) {
    return FfiConverterSequenceNamedVector.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<NamedVector>> read(Uint8List buf) {
    List<NamedVector> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterNamedVector.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<NamedVector> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterNamedVector.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<NamedVector> value) {
    return value
            .map((l) => FfiConverterNamedVector.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<NamedVector> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequencePoint {
  static List<Point> lift(RustBuffer buf) {
    return FfiConverterSequencePoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Point>> read(Uint8List buf) {
    List<Point> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterPoint.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Point> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterPoint.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Point> value) {
    return value
            .map((l) => FfiConverterPoint.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Point> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequencePointId {
  static List<PointId> lift(RustBuffer buf) {
    return FfiConverterSequencePointId.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<PointId>> read(Uint8List buf) {
    List<PointId> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterPointId.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<PointId> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterPointId.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<PointId> value) {
    return value
            .map((l) => FfiConverterPointId.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<PointId> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequencePointVectors {
  static List<PointVectors> lift(RustBuffer buf) {
    return FfiConverterSequencePointVectors.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<PointVectors>> read(Uint8List buf) {
    List<PointVectors> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterPointVectors.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<PointVectors> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterPointVectors.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<PointVectors> value) {
    return value
            .map((l) => FfiConverterPointVectors.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<PointVectors> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequencePrefetch {
  static List<Prefetch> lift(RustBuffer buf) {
    return FfiConverterSequencePrefetch.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Prefetch>> read(Uint8List buf) {
    List<Prefetch> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterPrefetch.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Prefetch> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterPrefetch.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Prefetch> value) {
    return value
            .map((l) => FfiConverterPrefetch.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Prefetch> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceRecord {
  static List<Record> lift(RustBuffer buf) {
    return FfiConverterSequenceRecord.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<Record>> read(Uint8List buf) {
    List<Record> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterRecord.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<Record> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterRecord.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<Record> value) {
    return value
            .map((l) => FfiConverterRecord.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<Record> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceScoredPoint {
  static List<ScoredPoint> lift(RustBuffer buf) {
    return FfiConverterSequenceScoredPoint.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<ScoredPoint>> read(Uint8List buf) {
    List<ScoredPoint> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterScoredPoint.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<ScoredPoint> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterScoredPoint.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<ScoredPoint> value) {
    return value
            .map((l) => FfiConverterScoredPoint.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<ScoredPoint> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceSequenceDouble32 {
  static List<List<double>> lift(RustBuffer buf) {
    return FfiConverterSequenceSequenceDouble32.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<List<double>>> read(Uint8List buf) {
    List<List<double>> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterSequenceDouble32.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<List<double>> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterSequenceDouble32.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<List<double>> value) {
    return value
            .map((l) => FfiConverterSequenceDouble32.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<List<double>> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceSequenceScoredPoint {
  static List<List<ScoredPoint>> lift(RustBuffer buf) {
    return FfiConverterSequenceSequenceScoredPoint.read(
      buf.asUint8List(),
    ).value;
  }

  static LiftRetVal<List<List<ScoredPoint>>> read(Uint8List buf) {
    List<List<ScoredPoint>> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterSequenceScoredPoint.read(
        Uint8List.view(buf.buffer, offset),
      );
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<List<ScoredPoint>> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterSequenceScoredPoint.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<List<ScoredPoint>> value) {
    return value
            .map((l) => FfiConverterSequenceScoredPoint.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<List<ScoredPoint>> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceString {
  static List<String> lift(RustBuffer buf) {
    return FfiConverterSequenceString.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<String>> read(Uint8List buf) {
    List<String> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterString.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<String> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterString.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<String> value) {
    return value
            .map((l) => FfiConverterString.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<String> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterSequenceUInt32 {
  static List<int> lift(RustBuffer buf) {
    return FfiConverterSequenceUInt32.read(buf.asUint8List()).value;
  }

  static LiftRetVal<List<int>> read(Uint8List buf) {
    List<int> res = [];
    final length = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < length; i++) {
      final ret = FfiConverterUInt32.read(Uint8List.view(buf.buffer, offset));
      offset += ret.bytesRead;
      res.add(ret.value);
    }
    return LiftRetVal(res, offset - buf.offsetInBytes);
  }

  static int write(List<int> value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, value.length);
    int offset = buf.offsetInBytes + 4;
    for (var i = 0; i < value.length; i++) {
      offset += FfiConverterUInt32.write(
        value[i],
        Uint8List.view(buf.buffer, offset),
      );
    }
    return offset - buf.offsetInBytes;
  }

  static int allocationSize(List<int> value) {
    return value
            .map((l) => FfiConverterUInt32.allocationSize(l))
            .fold(0, (a, b) => a + b) +
        4;
  }

  static RustBuffer lower(List<int> value) {
    final buf = Uint8List(allocationSize(value));
    write(value, buf);
    return toRustBuffer(buf);
  }
}

class FfiConverterString {
  static String lift(RustBuffer buf) {
    return utf8.decoder.convert(buf.asUint8List());
  }

  static RustBuffer lower(String value) {
    return toRustBuffer(Utf8Encoder().convert(value));
  }

  static LiftRetVal<String> read(Uint8List buf) {
    final end = buf.buffer.asByteData(buf.offsetInBytes).getInt32(0) + 4;
    return LiftRetVal(utf8.decoder.convert(buf, 4, end), end);
  }

  static int allocationSize([String value = ""]) {
    return utf8.encoder.convert(value).length + 4;
  }

  static int write(String value, Uint8List buf) {
    final list = utf8.encoder.convert(value);
    buf.buffer.asByteData(buf.offsetInBytes).setInt32(0, list.length);
    buf.setAll(4, list);
    return list.length + 4;
  }
}

class FfiConverterUInt32 {
  static int lift(int value) => value;
  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getUint32(0), 4);
  }

  static int lower(int value) {
    if (value < 0 || value > 4294967295) {
      throw ArgumentError("Value out of range for u32: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 4;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setUint32(0, lower(value));
    return 4;
  }
}

class FfiConverterUInt64 {
  static int lift(int value) => value;
  static LiftRetVal<int> read(Uint8List buf) {
    return LiftRetVal(buf.buffer.asByteData(buf.offsetInBytes).getUint64(0), 8);
  }

  static int lower(int value) {
    if (value < 0) {
      throw ArgumentError("Value out of range for u64: " + value.toString());
    }
    return value;
  }

  static int allocationSize([int value = 0]) {
    return 8;
  }

  static int write(int value, Uint8List buf) {
    buf.buffer.asByteData(buf.offsetInBytes).setUint64(0, lower(value));
    return 8;
  }
}

const int UNIFFI_RUST_FUTURE_POLL_READY = 0;
const int UNIFFI_RUST_FUTURE_POLL_MAYBE_READY = 1;
typedef UniffiRustFutureContinuationCallback = Void Function(Uint64, Int8);
final _uniffiRustFutureContinuationHandles = UniffiHandleMap<Completer<int>>();
Future<T> uniffiRustCallAsync<T, F>(
  Pointer<Void> Function() rustFutureFunc,
  void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
  pollFunc,
  F Function(Pointer<Void>, Pointer<RustCallStatus>) completeFunc,
  void Function(Pointer<Void>) freeFunc,
  T Function(F) liftFunc, [
  UniffiRustCallStatusErrorHandler? errorHandler,
]) async {
  final rustFuture = rustFutureFunc();
  final completer = Completer<int>();
  final handle = _uniffiRustFutureContinuationHandles.insert(completer);
  final callbackData = Pointer<Void>.fromAddress(handle);
  late final NativeCallable<UniffiRustFutureContinuationCallback> callback;
  void repoll() {
    pollFunc(rustFuture, callback.nativeFunction, callbackData);
  }

  void onResponse(int data, int pollResult) {
    if (pollResult == UNIFFI_RUST_FUTURE_POLL_READY) {
      final readyCompleter = _uniffiRustFutureContinuationHandles.maybeRemove(
        data,
      );
      if (readyCompleter != null && !readyCompleter.isCompleted) {
        readyCompleter.complete(pollResult);
      }
    } else if (pollResult == UNIFFI_RUST_FUTURE_POLL_MAYBE_READY) {
      repoll();
    } else {
      final errorCompleter = _uniffiRustFutureContinuationHandles.maybeRemove(
        data,
      );
      if (errorCompleter != null && !errorCompleter.isCompleted) {
        errorCompleter.completeError(
          UniffiInternalError.panicked(
            "Unexpected poll result from Rust future: \$pollResult",
          ),
        );
      }
    }
  }

  callback = NativeCallable<UniffiRustFutureContinuationCallback>.listener(
    onResponse,
  );
  try {
    repoll();
    await completer.future;
    final status = calloc<RustCallStatus>();
    try {
      final result = completeFunc(rustFuture, status);
      checkCallStatus(errorHandler ?? NullRustCallStatusErrorHandler(), status);
      return liftFunc(result);
    } finally {
      calloc.free(status);
    }
  } finally {
    callback.close();
    _uniffiRustFutureContinuationHandles.maybeRemove(handle);
    freeFunc(rustFuture);
  }
}

typedef UniffiForeignFutureFree = Void Function(Uint64);
typedef UniffiForeignFutureFreeDart = void Function(int);

class _UniffiForeignFutureState {
  bool cancelled = false;
}

final _uniffiForeignFutureHandleMap =
    UniffiHandleMap<_UniffiForeignFutureState>();
void _uniffiForeignFutureFree(int handle) {
  final state = _uniffiForeignFutureHandleMap.maybeRemove(handle);
  if (state != null) {
    state.cancelled = true;
  }
}

final Pointer<NativeFunction<UniffiForeignFutureFree>>
_uniffiForeignFutureFreePointer = Pointer.fromFunction<UniffiForeignFutureFree>(
  _uniffiForeignFutureFree,
);

final class UniffiForeignFuture extends Struct {
  @Uint64()
  external int handle;
  external Pointer<NativeFunction<UniffiForeignFutureFree>> free;
}

class UniffiHandleMap<T> {
  final Map<int, T> _map = {};
  int _counter = 1;
  int insert(T obj) {
    final handle = _counter;
    _counter += 2;
    _map[handle] = obj;
    return handle;
  }

  T get(int handle) {
    final obj = _map[handle];
    if (obj == null) {
      throw UniffiInternalError(
        UniffiInternalError.unexpectedStaleHandle,
        "Handle not found",
      );
    }
    return obj;
  }

  T remove(int handle) {
    final obj = maybeRemove(handle);
    if (obj == null) {
      throw UniffiInternalError(
        UniffiInternalError.unexpectedStaleHandle,
        "Handle not found",
      );
    }
    return obj;
  }

  T? maybeRemove(int handle) {
    return _map.remove(handle);
  }
}

const _uniffiAssetId = "package:qdrant_edge/uniffi:qdrant_edge_ffi";
void unpackSnapshot({
  required String snapshotPath,
  required String targetPath,
}) {
  return rustCall((status) {
    uniffi_qdrant_edge_ffi_fn_func_unpack_snapshot(
      FfiConverterString.lower(snapshotPath),
      FfiConverterString.lower(targetPath),
      status,
    );
  }, edgeExceptionErrorHandler);
}

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_clone_expression(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_free_expression(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_abs(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_condition(
  RustBuffer condition,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Float, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_constant(
  double value,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_datetime(
  RustBuffer value,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_datetime_key(
  RustBuffer key,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    Pointer<Void>,
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_decay(
  RustBuffer kind,
  Pointer<Void> x,
  RustBuffer target,
  RustBuffer midpoint,
  RustBuffer scale,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    Pointer<Void>,
    Pointer<Void>,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_div(
  Pointer<Void> left,
  Pointer<Void> right,
  RustBuffer by_zero_default,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_exp(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_geo_distance(
  RustBuffer origin,
  RustBuffer to,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_ln(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_log10(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_mult(
  RustBuffer factors,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_negate(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_pow(
  Pointer<Void> base,
  Pointer<Void> exponent,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_sqrt(
  Pointer<Void> expression,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_expression_sum(
  RustBuffer terms,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_expression_variable(
  RustBuffer name,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_clone_edgeshard(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_free_edgeshard(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_edgeshard_create(
  RustBuffer path,
  RustBuffer config,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_constructor_edgeshard_load(
  RustBuffer path,
  RustBuffer config,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Uint64 Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_qdrant_edge_ffi_fn_method_edgeshard_count(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_facet(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_query_groups(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_info(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_search_matrix(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_query(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_retrieve(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_scroll(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  RustBuffer Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_search(
  Pointer<Void> ptr,
  RustBuffer request,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_config(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_flush(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int uniffi_qdrant_edge_ffi_fn_method_edgeshard_optimize(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer uniffi_qdrant_edge_ffi_fn_method_edgeshard_path(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_hnsw_config(
  Pointer<Void> ptr,
  RustBuffer hnsw_config,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_optimizers_config(
  Pointer<Void> ptr,
  RustBuffer optimizers,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(Pointer<Void>, RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_set_vector_hnsw_config(
  Pointer<Void> ptr,
  RustBuffer vector_name,
  RustBuffer hnsw_config,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer
uniffi_qdrant_edge_ffi_fn_method_edgeshard_snapshot_manifest(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_unload(
  Pointer<Void> ptr,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(Pointer<Void>, RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_update_from_snapshot(
  Pointer<Void> ptr,
  RustBuffer snapshot_path,
  RustBuffer tmp_dir,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_method_edgeshard_update(
  Pointer<Void> ptr,
  Pointer<Void> operation,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void> uniffi_qdrant_edge_ffi_fn_clone_updateoperation(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_free_updateoperation(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_clear_payload(
  RustBuffer point_ids,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_clear_payload_by_filter(
  RustBuffer filter,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    Uint64,
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_dense_vector(
  RustBuffer vector_name,
  int size,
  RustBuffer distance,
  RustBuffer multivector_config,
  RustBuffer datatype,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_field_index(
  RustBuffer field_name,
  RustBuffer schema,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_field_index_with_params(
  RustBuffer field_name,
  RustBuffer params,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_create_sparse_vector(
  RustBuffer vector_name,
  RustBuffer modifier,
  RustBuffer datatype,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_field_index(
  RustBuffer field_name,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_payload(
  RustBuffer point_ids,
  RustBuffer keys,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_payload_by_filter(
  RustBuffer filter,
  RustBuffer keys,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_points(
  RustBuffer point_ids,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_points_by_filter(
  RustBuffer filter,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Pointer<Void> Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vector_name(
  RustBuffer vector_name,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vectors(
  RustBuffer point_ids,
  RustBuffer vector_names,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_delete_vectors_by_filter(
  RustBuffer filter,
  RustBuffer vector_names,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_overwrite_payload(
  RustBuffer point_ids,
  RustBuffer payload_json,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_overwrite_payload_by_filter(
  RustBuffer filter,
  RustBuffer payload_json,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_set_payload(
  RustBuffer point_ids,
  RustBuffer payload_json,
  RustBuffer key,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_set_payload_by_filter(
  RustBuffer filter,
  RustBuffer payload_json,
  RustBuffer key,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_update_vectors(
  RustBuffer point_vectors,
  RustBuffer condition,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Pointer<Void> Function(
    RustBuffer,
    RustBuffer,
    RustBuffer,
    Pointer<RustCallStatus>,
  )
>(assetId: _uniffiAssetId)
external Pointer<Void>
uniffi_qdrant_edge_ffi_fn_constructor_updateoperation_upsert_points(
  RustBuffer points,
  RustBuffer condition,
  RustBuffer update_mode,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(RustBuffer, RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void uniffi_qdrant_edge_ffi_fn_func_unpack_snapshot(
  RustBuffer snapshot_path,
  RustBuffer target_path,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_qdrant_edge_ffi_rustbuffer_alloc(
  int size,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(ForeignBytes, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_qdrant_edge_ffi_rustbuffer_from_bytes(
  ForeignBytes bytes,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Void Function(RustBuffer, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void ffi_qdrant_edge_ffi_rustbuffer_free(
  RustBuffer buf,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<RustBuffer Function(RustBuffer, Uint64, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_qdrant_edge_ffi_rustbuffer_reserve(
  RustBuffer buf,
  int additional,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_u8(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_u8(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_u8(Pointer<Void> handle);

@Native<Uint8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_u8(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_i8(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_i8(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_i8(Pointer<Void> handle);

@Native<Int8 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_i8(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_u16(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_u16(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_u16(Pointer<Void> handle);

@Native<Uint16 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_u16(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_i16(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_i16(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_i16(Pointer<Void> handle);

@Native<Int16 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_i16(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_u32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_u32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_u32(Pointer<Void> handle);

@Native<Uint32 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_u32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_i32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_i32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_i32(Pointer<Void> handle);

@Native<Int32 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_i32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_u64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_u64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_u64(Pointer<Void> handle);

@Native<Uint64 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_u64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_i64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_i64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_i64(Pointer<Void> handle);

@Native<Int64 Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external int ffi_qdrant_edge_ffi_rust_future_complete_i64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_f32(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_f32(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_f32(Pointer<Void> handle);

@Native<Float Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external double ffi_qdrant_edge_ffi_rust_future_complete_f32(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_f64(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_f64(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_f64(Pointer<Void> handle);

@Native<Double Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external double ffi_qdrant_edge_ffi_rust_future_complete_f64(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_rust_buffer(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_rust_buffer(
  Pointer<Void> handle,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_rust_buffer(
  Pointer<Void> handle,
);

@Native<RustBuffer Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external RustBuffer ffi_qdrant_edge_ffi_rust_future_complete_rust_buffer(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<
  Void Function(
    Pointer<Void>,
    Pointer<NativeFunction<UniffiRustFutureContinuationCallback>>,
    Pointer<Void>,
  )
>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_poll_void(
  Pointer<Void> handle,
  Pointer<NativeFunction<UniffiRustFutureContinuationCallback>> callback,
  Pointer<Void> callback_data,
);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_cancel_void(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>)>(assetId: _uniffiAssetId)
external void ffi_qdrant_edge_ffi_rust_future_free_void(Pointer<Void> handle);

@Native<Void Function(Pointer<Void>, Pointer<RustCallStatus>)>(
  assetId: _uniffiAssetId,
)
external void ffi_qdrant_edge_ffi_rust_future_complete_void(
  Pointer<Void> handle,
  Pointer<RustCallStatus> uniffiStatus,
);

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_func_unpack_snapshot();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_count();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_facet();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_query_groups();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_info();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_search_matrix();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_query();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_retrieve();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_scroll();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_search();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_config();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_flush();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_optimize();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_path();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_hnsw_config();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_optimizers_config();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_vector_hnsw_config();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_method_edgeshard_snapshot_manifest();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_unload();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_method_edgeshard_update_from_snapshot();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_method_edgeshard_update();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_abs();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_condition();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_constant();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_datetime();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_expression_datetime_key();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_decay();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_div();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_exp();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_expression_geo_distance();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_ln();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_log10();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_mult();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_negate();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_pow();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_sqrt();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_sum();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_expression_variable();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_edgeshard_create();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int uniffi_qdrant_edge_ffi_checksum_constructor_edgeshard_load();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_clear_payload();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_clear_payload_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_dense_vector();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_field_index();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_field_index_with_params();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_sparse_vector();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_field_index();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_payload();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_payload_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_points();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_points_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vector_name();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vectors();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vectors_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_overwrite_payload();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_overwrite_payload_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_set_payload();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_set_payload_by_filter();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_update_vectors();

@Native<Uint16 Function()>(assetId: _uniffiAssetId)
external int
uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_upsert_points();

@Native<Uint32 Function()>(assetId: _uniffiAssetId)
external int ffi_qdrant_edge_ffi_uniffi_contract_version();

void _checkApiVersion() {
  final bindingsVersion = 30;
  final scaffoldingVersion = ffi_qdrant_edge_ffi_uniffi_contract_version();
  if (bindingsVersion != scaffoldingVersion) {
    throw UniffiInternalError.panicked(
      "UniFFI contract version mismatch: bindings version \$bindingsVersion, scaffolding version \$scaffoldingVersion",
    );
  }
}

void _checkApiChecksums() {
  if (uniffi_qdrant_edge_ffi_checksum_func_unpack_snapshot() != 31275) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_count() != 38135) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_facet() != 5019) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_query_groups() !=
      34509) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_info() != 55438) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_search_matrix() !=
      55429) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_query() != 28290) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_retrieve() != 25809) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_scroll() != 64414) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_search() != 38403) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_config() != 7286) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_flush() != 28793) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_optimize() != 24352) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_path() != 40147) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_hnsw_config() !=
      51580) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_optimizers_config() !=
      37759) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_set_vector_hnsw_config() !=
      6150) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_snapshot_manifest() !=
      29389) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_unload() != 4024) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_update_from_snapshot() !=
      57723) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_method_edgeshard_update() != 3105) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_abs() != 18537) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_condition() !=
      11536) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_constant() !=
      13163) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_datetime() !=
      21386) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_datetime_key() !=
      14358) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_decay() != 58315) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_div() != 3246) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_exp() != 51249) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_geo_distance() !=
      9892) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_ln() != 2801) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_log10() != 56463) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_mult() != 60946) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_negate() !=
      32700) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_pow() != 49536) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_sqrt() != 28223) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_sum() != 21026) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_expression_variable() !=
      1342) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_edgeshard_create() != 26296) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_edgeshard_load() != 63345) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_clear_payload() !=
      54227) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_clear_payload_by_filter() !=
      32297) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_dense_vector() !=
      59709) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_field_index() !=
      11499) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_field_index_with_params() !=
      63779) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_create_sparse_vector() !=
      60555) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_field_index() !=
      56730) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_payload() !=
      41879) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_payload_by_filter() !=
      39886) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_points() !=
      38690) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_points_by_filter() !=
      57929) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vector_name() !=
      38671) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vectors() !=
      40245) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_delete_vectors_by_filter() !=
      34480) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_overwrite_payload() !=
      58014) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_overwrite_payload_by_filter() !=
      50754) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_set_payload() !=
      19532) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_set_payload_by_filter() !=
      24122) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_update_vectors() !=
      23937) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
  if (uniffi_qdrant_edge_ffi_checksum_constructor_updateoperation_upsert_points() !=
      10323) {
    throw UniffiInternalError.panicked("UniFFI API checksum mismatch");
  }
}

void ensureInitialized() {
  _checkApiVersion();
  _checkApiChecksums();
}

@Deprecated("Use ensureInitialized instead")
void initialize() {
  ensureInitialized();
}
