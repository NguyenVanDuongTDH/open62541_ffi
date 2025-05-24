
import 'open62541_ffi_platform_interface.dart';

class Open62541Ffi {
  Future<String?> getPlatformVersion() {
    return Open62541FfiPlatform.instance.getPlatformVersion();
  }
}
