# CMake generated Testfile for 
# Source directory: D:/cmake-3.27.7/Utilities/cmcurl
# Build directory: D:/cmake-3.27.7/build/Utilities/cmcurl
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[curl]=] "curltest" "http://open.cdash.org/user.php")
set_tests_properties([=[curl]=] PROPERTIES  _BACKTRACE_TRIPLES "D:/cmake-3.27.7/Utilities/cmcurl/CMakeLists.txt;1580;add_test;D:/cmake-3.27.7/Utilities/cmcurl/CMakeLists.txt;0;")
subdirs("lib")
