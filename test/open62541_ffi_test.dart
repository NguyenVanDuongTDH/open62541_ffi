import 'package:flutter_test/flutter_test.dart';
import 'package:open62541_ffi/open62541_ffi.dart';
import 'package:open62541_ffi/open62541_ffi_platform_interface.dart';
import 'package:open62541_ffi/open62541_ffi_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockOpen62541FfiPlatform
    with MockPlatformInterfaceMixin
    implements Open62541FfiPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final Open62541FfiPlatform initialPlatform = Open62541FfiPlatform.instance;

  test('$MethodChannelOpen62541Ffi is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelOpen62541Ffi>());
  });

  test('getPlatformVersion', () async {
    Open62541Ffi open62541FfiPlugin = Open62541Ffi();
    MockOpen62541FfiPlatform fakePlatform = MockOpen62541FfiPlatform();
    Open62541FfiPlatform.instance = fakePlatform;

    expect(await open62541FfiPlugin.getPlatformVersion(), '42');
  });
}
