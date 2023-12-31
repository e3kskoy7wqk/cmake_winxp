list(APPEND CMAKE_FIND_LIBRARY_PREFIXES lib)
list(APPEND CMAKE_FIND_LIBRARY_SUFFIXES .a)
set(ENV_PATH "$ENV{PATH}")
set(ENV_CMAKE_PREFIX_PATH "$ENV{CMAKE_PREFIX_PATH}")
set(ENV{PATH} "")
set(ENV{CMAKE_PREFIX_PATH} "")
file(MAKE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/lib)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/lib/libcreated.a" "created")

foreach(path "/does_not_exist" "/lib" "")
  unset(CREATED_LIBRARY CACHE)
  set(CMAKE_PREFIX_PATH "${CMAKE_CURRENT_BINARY_DIR}${path}")
  find_library(CREATED_LIBRARY NAMES created)
  message(STATUS "CREATED_LIBRARY='${CREATED_LIBRARY}'")
endforeach()

set(CMAKE_FIND_USE_CMAKE_PATH OFF)
set(CMAKE_PREFIX_PATH )
foreach(path "/does_not_exist" "/lib" "")
  unset(CREATED_LIBRARY CACHE)
  set(CMAKE_PREFIX_PATH "${CMAKE_CURRENT_BINARY_DIR}${path}")
  find_library(CREATED_LIBRARY NAMES created)
  message(STATUS "CREATED_LIBRARY='${CREATED_LIBRARY}'")
endforeach()
set(CMAKE_FIND_USE_SYSTEM_ENVIRONMENT_PATH ON)
set(ENV{PATH} "${ENV_PATH}")
set(ENV{CMAKE_PREFIX_PATH} "${ENV_CMAKE_PREFIX_PATH}")
