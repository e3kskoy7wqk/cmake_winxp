# CMake generated Testfile for 
# Source directory: D:/cmake-3.27.7
# Build directory: D:/cmake-3.27.7/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
include("D:/cmake-3.27.7/build/Tests/EnforceConfig.cmake")
add_test([=[SystemInformationNew]=] "D:/cmake-3.27.7/build/bin/cmake" "--system-information" "-G" "MinGW Makefiles")
set_tests_properties([=[SystemInformationNew]=] PROPERTIES  _BACKTRACE_TRIPLES "D:/cmake-3.27.7/CMakeLists.txt;519;add_test;D:/cmake-3.27.7/CMakeLists.txt;0;")
subdirs("Source/kwsys")
subdirs("Utilities/std")
subdirs("Utilities/KWIML")
subdirs("Utilities/cmlibrhash")
subdirs("Utilities/cmcurl")
subdirs("Utilities/cmnghttp2")
subdirs("Utilities/cmbzip2")
subdirs("Utilities/cmliblzma")
subdirs("Utilities/cmlibarchive")
subdirs("Utilities/cmjsoncpp")
subdirs("Utilities/cmlibuv")
subdirs("Utilities/cmcppdap")
subdirs("Source")
subdirs("Utilities")
subdirs("Tests")
subdirs("Auxiliary")
