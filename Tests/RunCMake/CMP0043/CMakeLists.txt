cmake_minimum_required(VERSION 2.8.12)
project(${RunCMake_TEST} CXX)
include(${RunCMake_TEST}.cmake NO_POLICY_SCOPE) # policy used at end of dir

if(CMAKE_BUILD_TYPE)
  # Dummy variable use
endif()
