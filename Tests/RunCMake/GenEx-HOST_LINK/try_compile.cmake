
enable_language(C)

add_library(demo INTERFACE IMPORTED)
set_property(TARGET demo PROPERTY INTERFACE_LINK_OPTIONS "$<HOST_LINK:>")

set(CMAKE_TRY_COMPILE_TARGET_TYPE EXECUTABLE)
try_compile(result "${CMAKE_CURRENT_BINARY_DIR}/tc" "${CMAKE_CURRENT_SOURCE_DIR}/empty.c"
  LINK_LIBRARIES demo)
