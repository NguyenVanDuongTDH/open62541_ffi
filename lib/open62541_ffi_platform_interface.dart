import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'open62541_ffi_method_channel.dart';

abstract class Open62541FfiPlatform extends PlatformInterface {
  /// Constructs a Open62541FfiPlatform.
  Open62541FfiPlatform() : super(token: _token);

  static final Object _token = Object();

  static Open62541FfiPlatform _instance = MethodChannelOpen62541Ffi();

  /// The default instance of [Open62541FfiPlatform] to use.
  ///
  /// Defaults to [MethodChannelOpen62541Ffi].
  static Open62541FfiPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [Open62541FfiPlatform] when
  /// they register themselves.
  static set instance(Open62541FfiPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
