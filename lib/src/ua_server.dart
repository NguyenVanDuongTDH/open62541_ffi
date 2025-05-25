// import 'dart:async';
// import 'dart:ffi';

// import 'package:ffi/ffi.dart';
// import 'package:open62541_ffi/open62541.dart';
// import 'package:open62541_ffi/src/open62541_gen.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_avarible_node.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_listen.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_method.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_nodeid_object.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_type_nodeid.dart';
// import 'package:open62541_ffi/src/server_chidren/server_bind.dart';

// class UAServer {
//   late final Pointer server;
//   Timer? _timer;
//   UAServer() {
//     server = UAServerCreate();
//     UAServerCreateMethodCallBack(server.cast());
//     UAServerCreateListenCallBack(server.cast());
//   }

//   void iterate() {
//     UAServerRunIterate(server.cast(), true);
//   }

//   bool start() {
//     bool retval = UAServerRunStartup(server.cast());
//     if (retval) {
//       _timer = Timer.periodic(const Duration(milliseconds: 2), (timer) async {
//         UAServerRunIterate(server.cast(), true);

//         Pointer<Int32> type = calloc.allocate(1);
//         Pointer<Pointer<UA_AsyncOperationRequest>> request = calloc.allocate(1);
//         Pointer<Pointer<Void>> context = calloc.allocate(1);
//         //
//         if (cOPC.UA_Server_getAsyncOperationNonBlocking(server.cast(), type,
//                 request, context, Pointer.fromAddress(0)) ==
//             true) {
//           //
//           final methodId =
//               UANodeId.fromNode(request.value.ref.callMethodRequest.methodId);
//           final input =
//               UAVariant(request.value.ref.callMethodRequest.inputArguments);
//           //
//           UAVariant res =
//               await UAServerDartMethodCall(server.cast(), methodId, input.data);

//           final response = cOPC.UA_FFI_Server_call(server.cast(), request);

//           response.ref.outputArgumentsSize = 1;
//           UAVariant(response.ref.outputArguments).copyFrom(res);

//           cOPC.UA_Server_setAsyncOperationResult(
//               server.cast(), response.cast(), context.value);
//           cOPC.UA_CallMethodResult_clear(response);
//           res.delete();
//         }
//         calloc.free(type);
//         calloc.free(request);
//         calloc.free(context);
//         //
//         //
//         //
//         //
//       });
//     }
//     return retval;
//   }

//   void dispose() {
//     if (_timer != null) {
//       _timer!.cancel();
//     }
//     UAServerRemoveMethodCallBack(server.cast());
//     UAServerRemoveListenCallBack(server.cast());
//     UAServerDelete(server.cast());
//   }

//   void setAddress({
//     String ip = "127.0.0.1",
//     int port = 4840,
//   }) {
//     UAServerSetAddress(server.cast(), ip: ip, port: port);
//   }

//   bool addTypeNodeId({
//     required UANodeId nodeID,
//     required UAQualifiedName qualifiedName,
//     UANodeId? parentNodeId,
//     String? description,
//     String? displayName,
//   }) {
//     return UAServerTypeNodeId(server.cast(),
//         nodeID: nodeID.clone(),
//         qualifiedName: qualifiedName,
//         description: description,
//         displayName: description,
//         parentNodeId: parentNodeId?.clone());
//   }

//   bool addObjectNodeId({
//     required UANodeId nodeID,
//     required UANodeId nodeIdTypeNodeid,
//     required UAQualifiedName qualifiedName,
//     UANodeId? parentNodeId,
//     String? description,
//     String? displayName,
//   }) {
//     return UAServerAddObjectNodeId(server.cast(),
//         nodeID: nodeID.clone(),
//         nodeIdTypeNodeid: nodeIdTypeNodeid.clone(),
//         qualifiedName: qualifiedName,
//         description: description,
//         displayName: displayName,
//         parentNodeId: parentNodeId?.clone());
//   }

//   bool addVariableNodeId({
//     required UAVariant uaVariant,
//     required UANodeId nodeid,
//     required UAQualifiedName qualifiedName,
//     String? description,
//     String? displayName,
//     UANodeId? parentNodeId,
//     dynamic Function(UANodeId nodeId, dynamic value)? dataChangeCallBack,
//   }) {
//     return UAServerAddVariableNodeId(
//       server.cast(),
//       variant: uaVariant,
//       nodeid: nodeid.clone(),
//       qualifiedName: qualifiedName,
//       dataChangeCallBack: dataChangeCallBack,
//       description: description,
//       displayName: displayName,
//       parentNodeId: parentNodeId?.clone(),
//     );
//   }

//   void listenNodeId(UANodeId nodeID,
//       dynamic Function(UANodeId nodeId, dynamic value) callBack) {
//     UAServerValueChangeListen(server.cast(), nodeID.clone(), callBack);
//   }

//   void addMethod({
//     required UAQualifiedName browseName,
//     required UANodeId nodeId,
//     required UAArgument input,
//     required UAArgument output,
//     required dynamic Function(UANodeId uaNodeId, dynamic value) callBack,
//     String? description,
//     String? displayName,
//     UANodeId? perentNodeId,
//   }) {
//     UAServerAddMethod(server.cast(),
//         description: description,
//         displayName: displayName,
//         browseName: browseName,
//         nodeId: nodeId.clone(),
//         input: input,
//         output: output,
//         callBack: callBack,
//         parentNodeId: perentNodeId?.clone());
//   }
// }
