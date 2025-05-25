// ignore_for_file: unused_field, camel_case_extensions

import 'dart:ffi';

import 'package:open62541_ffi/open62541_bindings.dart';
import 'package:open62541_ffi/src/opject/opc_type.dart';
import 'package:open62541_ffi/src/opject/ua_convert.dart';
import 'package:open62541_ffi/src/ua_client.dart';

class UAVariant {
  UAVariant([Pointer<UA_Variant>? ptr]) {
    if (ptr == null) {
      _variant = lib.UA_Variant_new();
      lib.UA_Variant_init(_variant!);
    } else {
      _variant = ptr;
    }
  }

  Pointer<UA_Variant>? _variant;
  Pointer<UA_Variant> get variant => _variant!;
  int get arrayLength => variant.ref.arrayLength;
  int get arrayDimensionsSize => variant.ref.arrayDimensionsSize;
  int get type => UATypes.from(variant.ref.type)
      .index; //   lib.UA_GET_TYPES_INTDEX(variant.ref.type);
  dynamic get data => UaConvert.variant2Dart(this);

  bool isEmpty() {
    return lib.UA_Variant_isEmpty(variant);
  }

  void delete() {
    lib.UA_Variant_delete(variant);
  }

  void clear() {
    lib.UA_Variant_clear(variant);
  }

  int coppyTo(UAVariant dst) {
    return lib.UA_Variant_copy(variant, dst.variant);
  }

  void copyFrom(UAVariant src) {
    lib.UA_Variant_copy(src.variant, variant);
  }

  void setScalar(dynamic value, int uaType) {
    Pointer ptr = UaConvert.dart2Pointer(value, uaType);
    if (value is List) {
      lib.UA_Variant_setArray(
          variant, ptr.cast(), value.length, UATypes.from(uaType).type);
    } else {
      lib.UA_Variant_setScalar(variant, ptr.cast(), UATypes.from(uaType).type);
    }
  }

  @override
  String toString() {
    return data.toString();
  }
}

extension LIST2BOOL on List<bool> {
  UAVariant uaBoolArray() {
    return UAVariant()..setScalar(this, UATypes.BOOLEAN);
  }
}

extension bool2BOOL on bool {
  UAVariant uaBoool() {
    return UAVariant()..setScalar(this, UATypes.BOOLEAN);
  }
}

extension LIST2DF on List<double> {
  UAVariant uaFloatArray() {
    return UAVariant()..setScalar(this, UATypes.FLOAT);
  }

  UAVariant uaDoubleArray() {
    return UAVariant()..setScalar(this, UATypes.DOUBLE);
  }
}

extension LIST2INT on List<int> {
  UAVariant uaBytes() {
    return UAVariant()..setScalar(this, UATypes.BYTE);
  }

  UAVariant uaUint16Array() {
    return UAVariant()..setScalar(this, UATypes.UINT16);
  }

  UAVariant uaInt16Array() {
    return UAVariant()..setScalar(this, UATypes.INT16);
  }

  UAVariant uaUint32Array() {
    return UAVariant()..setScalar(this, UATypes.UINT32);
  }

  UAVariant uaInt32Array() {
    return UAVariant()..setScalar(this, UATypes.INT32);
  }

  UAVariant uaUint63Array() {
    return UAVariant()..setScalar(this, UATypes.UINT64);
  }

  UAVariant uaInt64Array() {
    return UAVariant()..setScalar(this, UATypes.INT64);
  }
}

// ////////////////
// ///////////////
// ///
// ///
// ///////////////
// ///////////////

extension String2STRING on String {
  UAVariant uaString() {
    return UAVariant()..setScalar(this, UATypes.STRING);
  }
}

extension LIST2String on List<String> {
  UAVariant uaStringArray() {
    return UAVariant()..setScalar(this, UATypes.STRING);
  }
}

extension Double2DF on double {
  UAVariant uaFloat() {
    return UAVariant()..setScalar(this, UATypes.FLOAT);
  }

  UAVariant uaDouble() {
    return UAVariant()..setScalar(this, UATypes.DOUBLE);
  }
}

extension int2INT on int {
  UAVariant uaByte() {
    return UAVariant()..setScalar(this, UATypes.BYTE);
  }

  UAVariant uaUint16() {
    return UAVariant()..setScalar(this, UATypes.UINT16);
  }

  UAVariant uaInt16() {
    return UAVariant()..setScalar(this, UATypes.INT16);
  }

  UAVariant uaUint32() {
    return UAVariant()..setScalar(this, UATypes.UINT32);
  }

  UAVariant uaInt32() {
    return UAVariant()..setScalar(this, UATypes.INT32);
  }

  UAVariant uaUint64() {
    return UAVariant()..setScalar(this, UATypes.UINT64);
  }

  UAVariant uaInt64() {
    return UAVariant()..setScalar(this, UATypes.INT64);
  }
}

extension UA_DYNAMIC on dynamic {
  UAVariant uaDynamic() {
    return UAVariant()..setScalar(this, UATypes.VARIANT);
  }
}
