import 'package:ffi/ffi.dart';
import 'package:open62541_ffi/open62541.dart';
import 'package:open62541_ffi/src/open62541_gen.dart';

class UAQualifiedName {
  int nsIndex;
  String name;

  UA_QualifiedName get ua_qualifiedName_new =>
      cOPC.UA_QUALIFIEDNAME(1, name.toNativeUtf8().cast());

  UAQualifiedName(this.nsIndex, this.name);
}
