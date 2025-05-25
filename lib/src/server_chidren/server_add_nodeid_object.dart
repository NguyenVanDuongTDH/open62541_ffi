// // ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';
// import 'package:ffi/ffi.dart';
// import 'package:open62541_ffi/open62541.dart';
// import 'package:open62541_ffi/src/open62541_gen.dart';

// bool UAServerAddObjectNodeId(Pointer<UA_Server> server,
//     {required UANodeId nodeID,
//     required UANodeId nodeIdTypeNodeid,
//     required UAQualifiedName qualifiedName,
//     UANodeId? parentNodeId,
//     String? description,
//     String? displayName}) {
//   UA_NodeId parent;
//   parent = cOPC.UA_NODEID_NUMERIC(0, UA_NS0ID_OBJECTSFOLDER);
//   Pointer<UA_ObjectAttributes> attr = cOPC.UA_ObjectAttributes_new();
//   cOPC.UA_ObjectAttributes_init(attr);
//   if (description != null) {
//     attr.ref.description = cOPC.UA_LOCALIZEDTEXT(
//         UAVariableAttributes.en_US.cast(), description.toNativeUtf8().cast());
//   }
//   if (displayName != null) {
//     attr.ref.displayName = cOPC.UA_LOCALIZEDTEXT(
//         UAVariableAttributes.en_US.cast(), displayName.toNativeUtf8().cast());
//   }

//   int ret = cOPC.UA_Server_addObjectNode(
//       server,
//       nodeID.nodeId,
//       parentNodeId == null ? parent : parentNodeId.nodeId,
//       cOPC.UA_NODEID_NUMERIC(0, UA_NS0ID_HASCOMPONENT),
//       cOPC.UA_QUALIFIEDNAME(
//           qualifiedName.nsIndex, qualifiedName.name.toNativeUtf8().cast()),
//       nodeIdTypeNodeid.nodeId,
//       attr.ref,
//       Pointer.fromAddress(0),
//       Pointer.fromAddress(0));
//   // cOPC.UA_ObjectAttributes_delete(attr);
//   return ret == 0;
// }
