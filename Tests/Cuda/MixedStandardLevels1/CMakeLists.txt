cmake_minimum_required(VERSION 3.18)
project(MixedStandardLevels1 CXX CUDA)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CUDA_STANDARD 11)

add_executable(MixedStandardLevels1 main.cu lib.cpp)

if(APPLE)
  # Help the static cuda runtime find the driver (libcuda.dyllib) at runtime.
  set_property(TARGET MixedStandardLevels1 PROPERTY BUILD_RPATH ${CMAKE_CUDA_IMPLICIT_LINK_DIRECTORIES})
endif()
