#include "include/open62541_ffi/open62541_ffi_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "open62541_ffi_plugin.h"

void Open62541FfiPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  open62541_ffi::Open62541FfiPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
