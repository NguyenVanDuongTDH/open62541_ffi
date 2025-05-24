import 'dart:ffi';
import 'dart:io';
import 'package:open62541_ffi/src/open62541_gen.dart';

NativeLibrary get cOPC => NativeLibrary(DynamicLibrary.open(_getPathLib()));

String _getPathLib() {
  if (Platform.isLinux) {
    return "/home/duong/Downloads/open62541-main/cpp/open62541.so";
  } else if (Platform.isWindows) {
    return "open62541.dll";
  } else if (Platform.isAndroid) {
    return "libopen62541.so";
  }
  return "OPEN62541 NOT PATH";
}
