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
include Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/compiler_depend.make

# Include the progress variables for this target.
include Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/progress.make

# Include the compile flags for this target's objects.
include Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/flags.make

Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/flags.make
Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/includes_CXX.rsp
Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj: D:/cmake-3.27.7/Source/QtDialog/CMakeSetup.cxx
Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj"
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj -MF CMakeFiles\CMakeGUIMainLib.dir\CMakeSetup.cxx.obj.d -o CMakeFiles\CMakeGUIMainLib.dir\CMakeSetup.cxx.obj -c D:\cmake-3.27.7\Source\QtDialog\CMakeSetup.cxx

Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing CXX source to CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.i"
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E D:\cmake-3.27.7\Source\QtDialog\CMakeSetup.cxx > CMakeFiles\CMakeGUIMainLib.dir\CMakeSetup.cxx.i

Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling CXX source to assembly CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.s"
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && D:\mingw\bin\c++.exe $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S D:\cmake-3.27.7\Source\QtDialog\CMakeSetup.cxx -o CMakeFiles\CMakeGUIMainLib.dir\CMakeSetup.cxx.s

# Object files for target CMakeGUIMainLib
CMakeGUIMainLib_OBJECTS = \
"CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj"

# External object files for target CMakeGUIMainLib
CMakeGUIMainLib_EXTERNAL_OBJECTS =

Source/QtDialog/libCMakeGUIMainLib.a: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/CMakeSetup.cxx.obj
Source/QtDialog/libCMakeGUIMainLib.a: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/build.make
Source/QtDialog/libCMakeGUIMainLib.a: Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libCMakeGUIMainLib.a"
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && $(CMAKE_COMMAND) -P CMakeFiles\CMakeGUIMainLib.dir\cmake_clean_target.cmake
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\CMakeGUIMainLib.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/build: Source/QtDialog/libCMakeGUIMainLib.a
.PHONY : Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/build

Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/clean:
	cd /d D:\cmake-3.27.7\build\Source\QtDialog && $(CMAKE_COMMAND) -P CMakeFiles\CMakeGUIMainLib.dir\cmake_clean.cmake
.PHONY : Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/clean

Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\cmake-3.27.7 D:\cmake-3.27.7\Source\QtDialog D:\cmake-3.27.7\build D:\cmake-3.27.7\build\Source\QtDialog D:\cmake-3.27.7\build\Source\QtDialog\CMakeFiles\CMakeGUIMainLib.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Source/QtDialog/CMakeFiles/CMakeGUIMainLib.dir/depend

