add_library(lib1 STATIC ../lib.c)
add_custom_command(OUTPUT lib1.h COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/lib1.h lib1.h)
target_sources(lib1 PUBLIC FILE_SET HEADERS BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR} FILES ${CMAKE_CURRENT_BINARY_DIR}/lib1.h)
