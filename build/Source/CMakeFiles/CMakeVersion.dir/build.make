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
include Source/CMakeFiles/CMakeVersion.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Source/CMakeFiles/CMakeVersion.dir/compiler_depend.make

# Include the progress variables for this target.
include Source/CMakeFiles/CMakeVersion.dir/progress.make

# Include the compile flags for this target's objects.
include Source/CMakeFiles/CMakeVersion.dir/flags.make

Source/CMakeFiles/CMakeVersion.dir/CMakeVersion.rc.obj: Source/CMakeFiles/CMakeVersion.dir/flags.make
Source/CMakeFiles/CMakeVersion.dir/CMakeVersion.rc.obj: Source/CMakeVersion.rc
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building RC object Source/CMakeFiles/CMakeVersion.dir/CMakeVersion.rc.obj"
	cd /d D:\cmake-3.27.7\build\Source && D:\mingw\bin\windres.exe -O coff $(RC_DEFINES) $(RC_INCLUDES) $(RC_FLAGS) D:\cmake-3.27.7\build\Source\CMakeVersion.rc CMakeFiles\CMakeVersion.dir\CMakeVersion.rc.obj

CMakeVersion: Source/CMakeFiles/CMakeVersion.dir/CMakeVersion.rc.obj
CMakeVersion: Source/CMakeFiles/CMakeVersion.dir/build.make
.PHONY : CMakeVersion

# Rule to build all files generated by this target.
Source/CMakeFiles/CMakeVersion.dir/build: CMakeVersion
.PHONY : Source/CMakeFiles/CMakeVersion.dir/build

Source/CMakeFiles/CMakeVersion.dir/clean:
	cd /d D:\cmake-3.27.7\build\Source && $(CMAKE_COMMAND) -P CMakeFiles\CMakeVersion.dir\cmake_clean.cmake
.PHONY : Source/CMakeFiles/CMakeVersion.dir/clean

Source/CMakeFiles/CMakeVersion.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\cmake-3.27.7 D:\cmake-3.27.7\Source D:\cmake-3.27.7\build D:\cmake-3.27.7\build\Source D:\cmake-3.27.7\build\Source\CMakeFiles\CMakeVersion.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Source/CMakeFiles/CMakeVersion.dir/depend
