cmake_minimum_required(VERSION 3.22.1)
project(open62541 LANGUAGES C)


set(UA_ENABLE_DEBUG_SANITIZER OFF CACHE BOOL "Disable sanitizers" FORCE)
# Configure open62541 build options
set(UA_LOGLEVEL 100 CACHE INTERNAL "")
set(BUILD_SHARED_LIBS ON CACHE INTERNAL "")
set(UA_ENABLE_INLINABLE_EXPORT ON CACHE INTERNAL "")
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION OFF CACHE INTERNAL "")

set(SOURCES
   ..src/linux/custom.h
   ..src/linux/open62541.c
   ..src/linux/open62541.h
)
add_library(open62541 SHARED ${SOURCES} )