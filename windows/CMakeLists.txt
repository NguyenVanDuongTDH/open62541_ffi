
# install(CODE "
#   file(COPY \"${CMAKE_CURRENT_SOURCE_DIR}/../src/windows/open62541.dll\" DESTINATION \"${CMAKE_BINARY_DIR}/runner/${CMAKE_BUILD_TYPE}/")


install(CODE "
  file(INSTALL
    DESTINATION \"${CMAKE_BINARY_DIR}/runner/Debug/\"
    TYPE FILE
    FILES \"${CMAKE_CURRENT_SOURCE_DIR}/../src/windows/open62541.dll\")
  
  file(INSTALL
    DESTINATION \"${CMAKE_BINARY_DIR}/runner/Release/\"
    TYPE FILE
    FILES \"${CMAKE_CURRENT_SOURCE_DIR}/../src/windows/open62541.dll\")
")