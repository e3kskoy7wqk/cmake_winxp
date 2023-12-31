set(CMAKE_SIZEOF_VOID_P 4)
set_property(GLOBAL PROPERTY FIND_LIBRARY_USE_LIB32_PATHS ON)
list(APPEND CMAKE_FIND_LIBRARY_PREFIXES lib)
list(APPEND CMAKE_FIND_LIBRARY_SUFFIXES .a)

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink lib ${CMAKE_CURRENT_BINARY_DIR}/lib32)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/lib/libtop.a" "top")
find_library(TOP_LIBRARY
  NAMES top
  PATHS ${CMAKE_CURRENT_BINARY_DIR}/lib
  NO_DEFAULT_PATH
  )
message("TOP_LIBRARY='${TOP_LIBRARY}'")

file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib/sub)
execute_process(COMMAND ${CMAKE_COMMAND} -E create_symlink . ${CMAKE_CURRENT_BINARY_DIR}/lib/sub/32)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/lib/sub/libsub.a" "sub")
find_library(SUB_LIBRARY
  NAMES sub
  PATHS ${CMAKE_CURRENT_BINARY_DIR}/lib/sub
  NO_DEFAULT_PATH
  )
message("SUB_LIBRARY='${SUB_LIBRARY}'")
