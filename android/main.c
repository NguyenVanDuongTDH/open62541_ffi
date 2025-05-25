
// #include <open62541/server.h>
// #include <open62541/server_config_default.h>
// #include <open62541/server_pubsub.h>
// #include <open62541/server_config_file_based.h>
// #include <open62541/statuscodes.h>

// #include <open62541/client_highlevel_async.h>
// #include <open62541/client.h>
// #include <open62541/client_config_default.h>
// #include <open62541/client_highlevel.h>
// #include <open62541/client_subscriptions.h>

// #include <open62541/plugin/certificategroup_default.h>
// #include <open62541/plugin/log_stdout.h>
// #include <open62541/types.h>


#include "open62541.h"

//==================================================================================================================
//==================================================================================================================
//===========================                                           ============================================
//===========================                 CLIENT                    ============================================
//===========================                                           ============================================
//==================================================================================================================
//==================================================================================================================

UA_EXPORT UA_Client *FFi_Client_new()
{
    return UA_Client_new(client);
}

UA_EXPORT UA_ClientConfig *FFi_Client_getConfig(UA_Client *client)
{
    return UA_Client_getConfig(client);
}
UA_EXPORT UA_StatusCode FFi_ClientConfig_setDefault(UA_Client *client)
{

    return UA_ClientConfig_setDefault(UA_Client_getConfig(client));
}

UA_EXPORT UA_StatusCode
FFI_Client_readValueAttribute(UA_Client *client, const UA_NodeId nodeId,
                              UA_Variant *outValue)
{
    return UA_Client_readValueAttribute(client, nodeId, outValue);
}

UA_EXPORT UA_StatusCode
FFI_Client_writeValueAttribute(UA_Client *client, const UA_NodeId nodeId,
                               UA_Variant *outValue)
{
    return UA_Client_writeValueAttribute(client, nodeId, outValue);
}
UA_EXPORT UA_StatusCode
FFI_Client_readValueAttribute_async(UA_Client *client, const UA_NodeId nodeId, UA_ClientAsyncReadValueAttributeCallback callback,
                                    void *userdata, UA_UInt32 *requestId)
{
    return UA_Client_readValueAttribute_async(client, nodeId, callback, userdata, requestId);
}

UA_EXPORT UA_StatusCode
FFI_Client_writeValueAttribute_async(UA_Client *client, const UA_NodeId nodeId, const UA_Variant *attr,
                                     UA_ClientAsyncWriteCallback callback, void *userdata, UA_UInt32 *reqId)
{
    return UA_Client_writeValueAttribute_async(client, nodeId, attr, callback, userdata, reqId);
}

UA_EXPORT UA_StatusCode FFI_Client_connect(UA_Client *client, const char *endpointUrl)
{
    return UA_Client_connect(client, endpointUrl);
}
typedef void (*StateCallback)(UA_Client *client, UA_SecureChannelState channelState, UA_SessionState sessionState, UA_StatusCode connectStatus);
UA_EXPORT UA_StatusCode FFI_Client_connect(UA_Client *client, const char *endpointUrl, StateCallback stateCallback)
{
    UA_StatusCode rev = UA_Client_connectAsync(client, endpointUrl);
    UA_ClientConfig *cc UA_Client_getConfig(client);
    cc->stateCallback = stateCallback;
    return rev;
}

UA_EXPORT void FFI_Client_getState(UA_Client *client, UA_SecureChannelState *channelState, UA_SessionState *sessionState, UA_StatusCode *connectStatus)
{
    UA_Client_getState(client, channelState, sessionState, connectStatus);
}

UA_EXPORT UA_StatusCode FFI_Client_disconnect(UA_Client *client, const char *endpointUrl)
{
    return UA_Client_disconnect(client, endpointUrl);
}

UA_EXPORT void FFI_Client_delete(UA_Client *client)
{
    UA_Client_delete(client);
}

//==================================================================================================================
//==================================================================================================================
//===========================                                           ============================================
//===========================                 TYPE                      ============================================
//===========================                                           ============================================
//==================================================================================================================
//==================================================================================================================

UA_EXPORT const UA_DataType *
FFI_Type_index(int index)
{
    return &UA_TYPES[index];
}
UA_EXPORT int
FFI_Index_type(UA_DataType *type)
{
    for (int i = 0; i < UA_TYPES_COUNT; i++)
        if (&UA_TYPES[i] == type)
            return i;
    return -1;
}
UA_EXPORT UA_NodeId
FFI_Typeid_form_type(const UA_DataType *type)
{
    return type->typeId;
}
UA_EXPORT UA_NodeId
FFI_Typeid_form_index(int index)
{
    return UA_TYPES[index].typeId;
}