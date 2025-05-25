// // ignore_for_file: non_constant_identifier_names

// import 'dart:ffi';

// import 'package:ffi/ffi.dart';
// import 'package:open62541_ffi/open62541.dart';
// import 'package:open62541_ffi/src/open62541_gen.dart';
// import 'package:open62541_ffi/src/server_chidren/server_add_method.dart';

// Pointer<Void> UAServerCreate() {
//   final server = cOPC.UA_Server_new();
//   var config = cOPC.UA_Server_getConfig(server);
//   cOPC.UA_ServerConfig_setDefault(config);
//   // config.ref.logging.ref = cOPC.UA_Log_Syslog();
//   return server.cast();
// }

// void UAServerSetAddress(Pointer<UA_Server> server,
//     {String ip = "127.0.0.1", int port = 4840}) {
//   var config = cOPC.UA_Server_getConfig(server);
//   config.ref.serverUrls.ref =
//       cOPC.UA_String_fromChars("opc.tcp://$ip:$port/".toNativeUtf8().cast());
// }

// bool UAServerRunIterate(Pointer<UA_Server> server, bool waitInternal) {
//   return cOPC.UA_Server_run_iterate(server, waitInternal) == 0;
// }

// bool UAServerRunStartup(Pointer<UA_Server> server) {
//   return cOPC.UA_Server_run_startup(server) == 0;
// }

// void UAServerDelete(Pointer<UA_Server> server) {
//   cOPC.UA_Server_delete(server);
// }
