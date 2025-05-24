import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'open62541_ffi_platform_interface.dart';

/// An implementation of [Open62541FfiPlatform] that uses method channels.
class MethodChannelOpen62541Ffi extends Open62541FfiPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('open62541_ffi');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
