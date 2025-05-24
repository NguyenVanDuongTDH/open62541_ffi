# Đường dẫn file DLL nằm cùng cấp với CMakeLists.txt trong plugin
set(DLL_SOURCE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../src/windows/open62541.dll")

# Đường dẫn thư mục chứa .exe được build ra của app (debug hoặc release)
# Chúng ta sẽ thử copy đến cả hai thư mục phổ biến:
#   - ${CMAKE_BINARY_DIR}/../Debug
#   - ${CMAKE_BINARY_DIR}/../Release

# Tạo target copy DLL
add_custom_target(copy_open62541_dll ALL
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
    "${DLL_SOURCE_PATH}"
    "${CMAKE_BINARY_DIR}/../x64/runner/Debug/open62541.dll"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different
    "${DLL_SOURCE_PATH}"
    "${CMAKE_BINARY_DIR}/../x64/runner/Release/open62541.dll"
  COMMENT "Copying open62541.dll to Debug/ and Release/ output directories"
)
