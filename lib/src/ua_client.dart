import 'dart:async';
import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:open62541_ffi/open62541_bindings.dart';

import 'opject/opc_node_id.dart';
import 'opject/opc_variant.dart';

FFIOpen62541 lib = FFIOpen62541(DynamicLibrary.open("libopen62541_ffi.so"));

class UAClient {
  late final Pointer<UA_Client> client;
  Timer? _timer;
  UAClient() {
    client = lib.FFI_Client_new();
  }
  bool connect(String endpointUrl) {
    final retval =
        lib.FFI_Client_connect(client, endpointUrl.toNativeUtf8().cast());

    if (retval == 0 && _timer == null) {
      _timer ??= Timer.periodic(const Duration(milliseconds: 100), (timer) {
        lib.FFI_Client_run_iterate(client, 1);
      });
    }
    return retval == 0;
  }

  bool get connected => _connected();
  Pointer<Uint32> _ptrConnectStatus = calloc.allocate(1);
  bool _connected() {
    lib.FFI_Client_getState(client, Pointer.fromAddress(0),
        Pointer.fromAddress(0), _ptrConnectStatus);
    return _ptrConnectStatus.value == 0;
  }

  bool disconnect() {
    _timer?.cancel();
    _timer = null;
    return lib.FFI_Client_disconnect(client) == 0;
  }

  void dispose() {
    disconnect();
    return lib.FFI_Client_delete(client);
  }

  dynamic readAttr(UANodeId nodeId) {
    dynamic result;
    UAVariant variant = UAVariant();
    int res = lib.UA_Client_readValueAttribute(
        client, nodeId.nodeId, variant.variant.cast());
    if (res == 0) {
      result = variant.data();
    } else {
      result = null;
    }
    variant.delete();
    return result;
  }

  bool writeNodeId(UANodeId nodeId, UAVariant variant) {
    int res = lib.UA_Client_writeValueAttribute(
        client, nodeId.nodeId, variant.variant);

    variant.delete();
    return res == 0;
  }

  // Future<dynamic> readNodeIdAsync(UANodeId nodeId) {
  //   return UAClientReadNodeIdAsync(client.cast(), nodeId);
  // }

  // Future<bool> writeNodeIdAsync(UANodeId nodeId, UAVariant variant) {
  //   return UAClientWriteNodeIdAsync(client.cast(), nodeId, variant);
  // }

  // Future<dynamic> methodCallAsync(UANodeId methodId, UAVariant input) {
  //   return Client_Method_call_async(client.cast(), methodId, input);
  // }

  // void listenNodeId(
  //   UANodeId nodeId,
  //   void Function(UANodeId, dynamic) callBack,
  // ) {
  //   UAClientListenNodeId(client.cast(), nodeId.clone(), callBack);
  // }
}
