//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <open62541_ffi/open62541_ffi_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) open62541_ffi_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "Open62541FfiPlugin");
  open62541_ffi_plugin_register_with_registrar(open62541_ffi_registrar);
}
