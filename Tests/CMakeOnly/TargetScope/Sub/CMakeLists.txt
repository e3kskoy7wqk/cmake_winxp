add_library(SubLibLocal UNKNOWN IMPORTED)
add_library(SubLibGlobal UNKNOWN IMPORTED GLOBAL)
add_subdirectory(Sub)
if(NOT TARGET SubLibLocal)
  message(FATAL_ERROR "SubLibLocal not visible in own directory")
endif()
if(NOT TARGET SubLibGlobal)
  message(FATAL_ERROR "SubLibGlobal not visible in own directory")
endif()
