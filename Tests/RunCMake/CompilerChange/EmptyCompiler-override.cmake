message(STATUS "CMAKE_C_COMPILER is \"${CMAKE_C_COMPILER}\"")
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/cc.cmake" "set(CMAKE_C_COMPILER \"${CMAKE_C_COMPILER}\")\n")
