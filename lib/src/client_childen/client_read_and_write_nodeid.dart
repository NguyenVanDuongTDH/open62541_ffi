// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:open62541_ffi/open62541_bindings.dart';
import 'package:open62541_ffi/src/ua_client.dart';

import '../opject/opc_node_id.dart';
import '../opject/opc_variant.dart';


dynamic UAClientReadNodeId(Pointer<UA_Client> client, UANodeId nodeId) {
  // read data server
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

bool UAClientWriteNodeId(
    Pointer<UA_Client> client, UANodeId nodeId, UAVariant variant) {
  int res =
      lib.UA_Client_writeValueAttribute(client, nodeId.nodeId, variant.variant);

  variant.delete();
  return res == 0;
}
