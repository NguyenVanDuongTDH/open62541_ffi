import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:open62541_ffi/open62541_bindings.dart';
import 'package:open62541_ffi/src/ua_client.dart';

import 'opc_type.dart';
import 'opc_variant.dart';

class UAVariableAttributes {
  late final Pointer<UA_VariableAttributes> attr;
  UAVariableAttributes() {
    attr = lib.UA_VariableAttributes_new();
    lib.UA_VariableAttributes_init(attr);
    final res = lib.UA_VariableAttributes_default;
    attr.ref = res;
    attr.ref.accessLevel = 255;
  }
  void delete() {
    // lib.UA_VariableAttributes_deleteMembers(attr);
    lib.UA_VariableAttributes_delete(attr);
  }

  void setVariant(UAVariant variant) {
    attr.ref.value = variant.variant.cast<UA_Variant>().ref;
    attr.ref.dataType =
        UATypes.from(variant.variant.cast<UA_Variant>().ref.type).typeId;
    // lib.UA_GET_TYPES_TYPEID(
    //     lib.UA_GET_TYPES_INTDEX(variant.variant.cast<UA_Variant>().ref.type));
    // attr.ref.dataType = lib.UA_GET_TYPES_TYPEID( UATypes.INT64);
    // print(" ${UATypes.INT64} == ${lib.UA_GET_TYPES_INTDEX(variant.variant.cast<UA_Variant>().ref.type)} ");
  }

  static int get READ => UA_ACCESSLEVELMASK_READ;
  static int get WRITE => UA_ACCESSLEVELMASK_WRITE;

  void setAsset(int access) {
    // attr.ref.userAccessLevel = access;
  }

  static final en_US = "en-US".toNativeUtf8();

  void setDescription(String? description) {
    if (description != null) {
      attr.ref.description =
          lib.UA_LOCALIZEDTEXT(en_US.cast(), description.toNativeUtf8().cast());
    }
  }

  void setDisplayName(String? displayName) {
    if (displayName != null) {
      attr.ref.displayName =
          lib.UA_LOCALIZEDTEXT(en_US.cast(), displayName.toNativeUtf8().cast());
    }
  }
}
