#ifndef FLUTTER_PLUGIN_OPEN62541_FFI_PLUGIN_H_
#define FLUTTER_PLUGIN_OPEN62541_FFI_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace open62541_ffi {

class Open62541FfiPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  Open62541FfiPlugin();

  virtual ~Open62541FfiPlugin();

  // Disallow copy and assign.
  Open62541FfiPlugin(const Open62541FfiPlugin&) = delete;
  Open62541FfiPlugin& operator=(const Open62541FfiPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace open62541_ffi

#endif  // FLUTTER_PLUGIN_OPEN62541_FFI_PLUGIN_H_
