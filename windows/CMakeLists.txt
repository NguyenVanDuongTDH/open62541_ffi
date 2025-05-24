
install(CODE "
  file(COPY \"${CMAKE_CURRENT_SOURCE_DIR}/../src/windows/open62541.dll\" DESTINATION \"${CMAKE_BINARY_DIR}/\")
")

