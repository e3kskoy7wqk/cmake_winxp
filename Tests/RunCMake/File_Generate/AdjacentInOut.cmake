cmake_policy(SET CMP0070 NEW)
if(EXISTS "${CMAKE_CURRENT_BINARY_DIR}/AdjacentInOut.txt")
  message(FATAL_ERROR "CMake should not re-run during the build!")
endif()
configure_file(AdjacentInOut.in ${CMAKE_CURRENT_BINARY_DIR}/AdjacentInOut.txt.tmp)
file(GENERATE OUTPUT AdjacentInOut.txt INPUT ${CMAKE_CURRENT_BINARY_DIR}/AdjacentInOut.txt.tmp)
