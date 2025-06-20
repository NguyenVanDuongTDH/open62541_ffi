// ignore_for_file: camel_case_types, unused_element

import 'dart:ffi' as ffi;

import 'package:open62541_ffi/open62541_bindings.dart';
import 'package:open62541_ffi/src/opject/opc_variant.dart';

final class _UA_DataValue extends ffi.Struct {
  external UA_Variant value;
}

class UADataValue {
  static dynamic toDart(ffi.Pointer<UA_DataValue> ptr) {
    return UAVariant(ptr.cast());
  }
}
