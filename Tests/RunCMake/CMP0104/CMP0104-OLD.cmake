set(ENV{CUDAARCHS})

cmake_policy(SET CMP0104 OLD)
include(CMP0104-Common.cmake)

if(CMAKE_CUDA_COMPILER_ID STREQUAL "NVIDIA")
  if(CMAKE_CUDA_ARCHITECTURES)
    message(FATAL_ERROR "CMAKE_CUDA_ARCHITECTURES isn't empty for NVIDIA with CMP0104 OLD.")
  endif()
else(NOT CMAKE_CUDA_COMPILER_ID STREQUAL "Unknown")
  if(NOT CMAKE_CUDA_ARCHITECTURES)
    message(FATAL_ERROR "CMAKE_CUDA_ARCHITECTURES isn't non-empty for non-NVIDIA with CMP0104 OLD.")
  endif()
endif()
