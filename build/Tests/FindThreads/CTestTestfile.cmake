# CMake generated Testfile for 
# Source directory: D:/cmake-3.27.7/Tests/FindThreads
# Build directory: D:/cmake-3.27.7/build/Tests/FindThreads
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[FindThreads.C-only]=] "D:/cmake-3.27.7/build/bin/ctest" "--build-and-test" "D:/cmake-3.27.7/Tests/FindThreads/C-only" "D:/cmake-3.27.7/build/Tests/FindThreads/C-only" "--build-generator" "MinGW Makefiles" "--build-makeprogram" "D:/mingw/bin/mingw32-make.exe" "--build-project" "FindThreads_C-only" "--build-options" "--test-command" "D:/cmake-3.27.7/build/bin/ctest" "-V")
set_tests_properties([=[FindThreads.C-only]=] PROPERTIES  _BACKTRACE_TRIPLES "D:/cmake-3.27.7/Tests/FindThreads/CMakeLists.txt;2;add_test;D:/cmake-3.27.7/Tests/FindThreads/CMakeLists.txt;0;")
add_test([=[FindThreads.CXX-only]=] "D:/cmake-3.27.7/build/bin/ctest" "--build-and-test" "D:/cmake-3.27.7/Tests/FindThreads/CXX-only" "D:/cmake-3.27.7/build/Tests/FindThreads/CXX-only" "--build-generator" "MinGW Makefiles" "--build-makeprogram" "D:/mingw/bin/mingw32-make.exe" "--build-project" "FindThreads_CXX-only" "--build-options" "--test-command" "D:/cmake-3.27.7/build/bin/ctest" "-V")
set_tests_properties([=[FindThreads.CXX-only]=] PROPERTIES  _BACKTRACE_TRIPLES "D:/cmake-3.27.7/Tests/FindThreads/CMakeLists.txt;2;add_test;D:/cmake-3.27.7/Tests/FindThreads/CMakeLists.txt;0;")
