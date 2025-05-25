import 'package:ffi/ffi.dart';
import 'package:open62541_ffi/open62541_bindings.dart';
import 'package:open62541_ffi/src/ua_client.dart';

class UAQualifiedName {
  int nsIndex;
  String name;

  UA_QualifiedName get ua_qualifiedName_new =>
      lib.UA_QUALIFIEDNAME(1, name.toNativeUtf8().cast());

  UAQualifiedName(this.nsIndex, this.name);
}
