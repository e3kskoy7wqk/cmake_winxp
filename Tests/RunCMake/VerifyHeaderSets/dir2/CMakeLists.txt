add_library(lib2 STATIC ../lib.c)
add_custom_command(OUTPUT lib2.h COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/lib2.h lib2.h)
target_sources(lib2 PUBLIC FILE_SET HEADERS BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR} FILES ${CMAKE_CURRENT_BINARY_DIR}/lib2.h)
