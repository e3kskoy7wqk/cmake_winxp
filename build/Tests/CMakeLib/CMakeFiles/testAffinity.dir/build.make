# CMAKE generated file: DO NOT EDIT!
# Generated by "MinGW Makefiles" Generator, CMake Version 3.27

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\CMake\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\CMake\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = D:\cmake-3.27.7

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = D:\cmake-3.27.7\build

# Include any dependencies generated for this target.
include Tests/CMakeLib/CMakeFiles/testAffinity.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Tests/CMakeLib/CMakeFiles/testAffinity.dir/compiler_depend.make

# Include the progress variables for this target.
include Tests/CMakeLib/CMakeFiles/testAffinity.dir/progress.make

# Include the compile flags for this target's objects.
include Tests/CMakeLib/CMakeFiles/testAffinity.dir/flags.make

Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj: Tests/CMakeLib/CMakeFiles/testAffinity.dir/flags.make
Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj: Tests/CMakeLib/CMakeFiles/testAffinity.dir/includes_CXX.rsp
Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj: D:/cmake-3.27.7/Tests/CMakeLib/testAffinity.cxx
Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj: Tests/CMakeLib/CMakeFiles/testAffinity.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj"
	cd /d D:\cmake-3.27.7\build\Tests\CMakeLib && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj -MF CMakeFiles\testAffinity.dir\testAffinity.cxx.obj.d -o CMakeFiles\testAffinity.dir\testAffinity.cxx.obj -c D:\cmake-3.27.7\Tests\CMakeLib\testAffinity.cxx

Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/testAffinity.dir/testAffinity.cxx.i"
	cd /d D:\cmake-3.27.7\build\Tests\CMakeLib && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\cmake-3.27.7\Tests\CMakeLib\testAffinity.cxx > CMakeFiles\testAffinity.dir\testAffinity.cxx.i

Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/testAffinity.dir/testAffinity.cxx.s"
	cd /d D:\cmake-3.27.7\build\Tests\CMakeLib && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\cmake-3.27.7\Tests\CMakeLib\testAffinity.cxx -o CMakeFiles\testAffinity.dir\testAffinity.cxx.s

# Object files for target testAffinity
testAffinity_OBJECTS = \
"CMakeFiles/testAffinity.dir/testAffinity.cxx.obj"

# External object files for target testAffinity
testAffinity_EXTERNAL_OBJECTS =

Tests/CMakeLib/testAffinity.exe: Tests/CMakeLib/CMakeFiles/testAffinity.dir/testAffinity.cxx.obj
Tests/CMakeLib/testAffinity.exe: Tests/CMakeLib/CMakeFiles/testAffinity.dir/build.make
Tests/CMakeLib/testAffinity.exe: Source/libCMakeLib.a
Tests/CMakeLib/testAffinity.exe: Utilities/std/libcmstd.a
Tests/CMakeLib/testAffinity.exe: Source/kwsys/libcmsys.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmcurl/lib/libcmcurl.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmnghttp2/libcmnghttp2.a
Tests/CMakeLib/testAffinity.exe: D:/dependencies/lib/libexpat.dll.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmlibarchive/libarchive/libcmlibarchive.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmbzip2/libcmbzip2.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmliblzma/libcmliblzma.a
Tests/CMakeLib/testAffinity.exe: D:/dependencies/lib/libzstd.dll.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmlibrhash/libcmlibrhash.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmlibuv/libcmlibuv.a
Tests/CMakeLib/testAffinity.exe: D:/dependencies/lib/libz.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmcppdap/libcmcppdap.a
Tests/CMakeLib/testAffinity.exe: Utilities/cmjsoncpp/libcmjsoncpp.a
Tests/CMakeLib/testAffinity.exe: Tests/CMakeLib/CMakeFiles/testAffinity.dir/linkLibs.rsp
Tests/CMakeLib/testAffinity.exe: Tests/CMakeLib/CMakeFiles/testAffinity.dir/objects1.rsp
Tests/CMakeLib/testAffinity.exe: Tests/CMakeLib/CMakeFiles/testAffinity.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable testAffinity.exe"
	cd /d D:\cmake-3.27.7\build\Tests\CMakeLib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\testAffinity.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Tests/CMakeLib/CMakeFiles/testAffinity.dir/build: Tests/CMakeLib/testAffinity.exe
.PHONY : Tests/CMakeLib/CMakeFiles/testAffinity.dir/build

Tests/CMakeLib/CMakeFiles/testAffinity.dir/clean:
	cd /d D:\cmake-3.27.7\build\Tests\CMakeLib && $(CMAKE_COMMAND) -P CMakeFiles\testAffinity.dir\cmake_clean.cmake
.PHONY : Tests/CMakeLib/CMakeFiles/testAffinity.dir/clean

Tests/CMakeLib/CMakeFiles/testAffinity.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\cmake-3.27.7 D:\cmake-3.27.7\Tests\CMakeLib D:\cmake-3.27.7\build D:\cmake-3.27.7\build\Tests\CMakeLib D:\cmake-3.27.7\build\Tests\CMakeLib\CMakeFiles\testAffinity.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Tests/CMakeLib/CMakeFiles/testAffinity.dir/depend
