# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)


install(CODE "
  file(COPY \"${CMAKE_CURRENT_SOURCE_DIR}/../src/linux/open62541.so\" DESTINATION \"${CMAKE_BINARY_DIR}/bundle/lib/\")
")