import 'dart:async';
import 'dart:ffi';

import 'package:open62541_ffi/open62541.dart';
import 'package:open62541_ffi/src/client_childen/client_connect.dart';
import 'package:open62541_ffi/src/client_childen/client_listen_variable.dart';
import 'package:open62541_ffi/src/client_childen/client_method_call.dart';
import 'package:open62541_ffi/src/client_childen/client_read_and_write_node_async.dart';
import 'package:open62541_ffi/src/client_childen/client_read_and_write_nodeid.dart';

import 'open62541_gen.dart';

class UAClient {
  late final Pointer<UA_Client> client;
  Timer? _timer;
  UAClient() {
    client = UAClientCreate();
    UAClientAddClientCallBack(client);
  }
  bool connect(String endpointUrl) {
    final retval = UAClientConnect(client.cast(), endpointUrl);

    // if (retval && _timer == null) {
    //   _timer ??= Timer.periodic(const Duration(milliseconds: 1), (timer) {
    //     runIterate(1);
    //   });
    // }
    return retval;
  }

  bool get connected => UAClientConnected(client);

  bool disconnect() {
    _timer?.cancel();
    _timer = null;
    return UAClientDisConnect(client.cast());
  }

  bool runIterate(int timeOut) {
    return UAClientRunIterate(client.cast(), timeOut);
  }

  void dispose() {
    return UAClientDispose(client.cast());
  }

  dynamic readNodeId(UANodeId nodeId) {
    return UAClientReadNodeId(client, nodeId);
  }

  bool writeNodeId(UANodeId nodeId, UAVariant variant) {
    return UAClientWriteNodeId(client.cast(), nodeId, variant);
  }

  Future<dynamic> readNodeIdAsync(UANodeId nodeId) {
    return UAClientReadNodeIdAsync(client.cast(), nodeId);
  }

  Future<bool> writeNodeIdAsync(UANodeId nodeId, UAVariant variant) {
    return UAClientWriteNodeIdAsync(client.cast(), nodeId, variant);
  }

  Future<dynamic> methodCallAsync(UANodeId methodId, UAVariant input) {
    return Client_Method_call_async(client.cast(), methodId, input);
  }

  void listenNodeId(
    UANodeId nodeId,
    void Function(UANodeId, dynamic) callBack,
  ) {
    UAClientListenNodeId(client.cast(), nodeId.clone(), callBack);
  }
}
