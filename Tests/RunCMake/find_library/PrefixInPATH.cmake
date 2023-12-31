list(APPEND CMAKE_FIND_LIBRARY_PREFIXES lib)
list(APPEND CMAKE_FIND_LIBRARY_SUFFIXES .a)

set(ENV_PATH "$ENV{PATH}")

set(CMAKE_FIND_DEBUG_MODE 1)
set(ENV{PATH} "${CMAKE_CURRENT_SOURCE_DIR}/does_not_exist")
find_library(PrefixInPATH_LIBRARY NAMES PrefixInPATH)
set(CMAKE_FIND_DEBUG_MODE 0)

foreach(path "/does_not_exist" "" "/bin" "/sbin")
  unset(PrefixInPATH_LIBRARY CACHE)
  set(ENV{PATH} "${CMAKE_CURRENT_SOURCE_DIR}${path}")
  find_library(PrefixInPATH_LIBRARY NAMES PrefixInPATH)
  message(STATUS "PrefixInPATH_LIBRARY='${PrefixInPATH_LIBRARY}'")
endforeach()
set(ENV{PATH} "${ENV_PATH}")
