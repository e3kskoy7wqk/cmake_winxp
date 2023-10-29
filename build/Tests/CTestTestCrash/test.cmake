cmake_minimum_required(VERSION 3.5)

# Settings:
set(CTEST_DASHBOARD_ROOT                "D:/cmake-3.27.7/build/Tests/CTestTest")
set(CTEST_SITE                          "PC-20230723EAUY")
set(CTEST_BUILD_NAME                    "CTestTest-Win32-mingw32-make-Crash")

set(CTEST_SOURCE_DIRECTORY              "D:/cmake-3.27.7/Tests/CTestTestCrash")
set(CTEST_BINARY_DIRECTORY              "D:/cmake-3.27.7/build/Tests/CTestTestCrash")
set(CTEST_CVS_COMMAND                   "")
set(CTEST_CMAKE_GENERATOR               "MinGW Makefiles")
set(CTEST_CMAKE_GENERATOR_PLATFORM      "")
set(CTEST_CMAKE_GENERATOR_TOOLSET       "")
set(CTEST_BUILD_CONFIGURATION           "$ENV{CMAKE_CONFIG_TYPE}")
set(CTEST_COVERAGE_COMMAND              "D:/mingw/bin/gcov.exe")
set(CTEST_NOTES_FILES                   "${CTEST_SCRIPT_DIRECTORY}/${CTEST_SCRIPT_NAME}")

#CTEST_EMPTY_BINARY_DIRECTORY(${CTEST_BINARY_DIRECTORY})

CTEST_START(Experimental)
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
CTEST_TEST(BUILD "${CTEST_BINARY_DIRECTORY}" RETURN_VALUE res)
#CTEST_SUBMIT()
