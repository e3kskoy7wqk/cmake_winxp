set(CTEST_CMAKE_GENERATOR "MinGW Makefiles")
set(CTEST_CMAKE_GENERATOR_PLATFORM "")
set(CTEST_CMAKE_GENERATOR_TOOLSET "")
set(CTEST_SOURCE_DIRECTORY "D:/cmake-3.27.7/Tests/CTestConfig")
set(CTEST_BINARY_DIRECTORY "D:/cmake-3.27.7/build/Tests/CTestConfig/Debug-script")

ctest_start(Experimental)

set(_isMultiConfig "0")
if(_isMultiConfig)
  set(cfg_opts "-DCMAKE_CONFIGURATION_TYPES=Debug\\;Release\\;MinSizeRel\\;RelWithDebInfo")
else()
  set(cfg_opts)
endif()

ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}" OPTIONS "${cfg_opts}" RETURN_VALUE rv)
if(NOT rv STREQUAL 0)
  message(FATAL_ERROR "*** error in ctest_configure ***")
endif()

ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE rv)
if(NOT rv STREQUAL 0)
  message(FATAL_ERROR "*** error in ctest_build ***")
endif()

ctest_test(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE rv)
if(NOT rv STREQUAL 0)
  message(FATAL_ERROR "*** error in ctest_test ***")
endif()
