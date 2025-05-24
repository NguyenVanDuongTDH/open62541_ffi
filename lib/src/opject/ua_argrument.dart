import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:open62541_ffi/open62541.dart';
import 'package:open62541_ffi/src/open62541_gen.dart';

class UAArgument {
  late final Pointer<UA_Argument> attr;
  UAArgument({
    required String name,
    required int uaType,
    int uaValueRank = UA_VALUERANK_SCALAR,
    String? description,
  }) {
    attr = cOPC.UA_Argument_new();
    cOPC.UA_Argument_init(attr);
    setName(name);
    setDataType(uaType);
    setDescription(description);
    setValueRank(uaValueRank);
  }

  void setDescription(String? description) {
    if (description != null) {
      attr.ref.description = cOPC.UA_LOCALIZEDTEXT(
          UAVariableAttributes.en_US.cast(),
          description.toNativeUtf8().cast());
    }
  }

  void setName(String? name) {
    if (name != null) {
      attr.ref.name = cOPC.UA_String_fromChars(name.toNativeUtf8().cast());
    }
  }

  int get uaType => _uaType!;
  int? _uaType;

  void setDataType(int uaType) {
    _uaType = uaType;
    attr.ref.dataType = UATypes.from(uaType).typeId;
  }

  void setValueRank(int uaValueRank) {
    attr.ref.valueRank = uaValueRank;
  }
}
