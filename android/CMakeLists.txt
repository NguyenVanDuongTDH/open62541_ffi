# The Flutter tooling requires that developers have CMake 3.10 or later
cmake_minimum_required(VERSION 3.10)

# Project-level configuration.
set(PROJECT_NAME "open62541_libs")
project(${PROJECT_NAME} LANGUAGES C)

# Disable sanitizers
set(UA_ENABLE_DEBUG_SANITIZER OFF CACHE BOOL "Disable sanitizers" FORCE)
# Configure open62541 build options
set(UA_LOGLEVEL 100 CACHE INTERNAL "")
set(BUILD_SHARED_LIBS ON CACHE INTERNAL "")
set(UA_ENABLE_INLINABLE_EXPORT ON CACHE INTERNAL "")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF CACHE INTERNAL "")
set(UA_ENABLE_ENCRYPTION "MBEDTLS" CACHE STRING "" FORCE)
set(UA_ENABLE_CLIENT ON CACHE BOOL "" FORCE)

# Use FetchContent
include(FetchContent)

# Add mbedTLS
FetchContent_Declare(
    mbedtls
    URL https://github.com/Mbed-TLS/mbedtls/archive/refs/tags/mbedtls-3.6.3.tar.gz
)

# Make mbedTLS available
FetchContent_MakeAvailable(mbedtls)
set(MBEDTLS_INCLUDE_DIRS ${mbedtls_BINARY_DIR}/include)
set(MBEDTLS_LIBRARY ${mbedtls_BINARY_DIR}/library/libmbedtls.a)
set(MBEDX509_LIBRARY ${mbedtls_BINARY_DIR}/library/libmbedx509.a)
set(MBEDCRYPTO_LIBRARY ${mbedtls_BINARY_DIR}/library/libmbedcrypto.a)

# Configure mbedTLS properties
set_target_properties(mbedtls mbedx509 mbedcrypto PROPERTIES
    ANDROID_NDK ${ANDROID_NDK}
    ANDROID_ABI ${ANDROID_ABI}
    ANDROID_PLATFORM ${ANDROID_PLATFORM}
)
# Add your main.c file
# Build main.c into a shared library named file.so
add_library(open62541_ffi SHARED 
main.c
open62541.h
open62541.c
)



# Link dependencies
target_link_libraries(open62541_ffi PRIVATE
    mbedtls
    mbedx509
    mbedcrypto
)
