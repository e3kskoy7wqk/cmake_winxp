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
include Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/compiler_depend.make

# Include the progress variables for this target.
include Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/progress.make

# Include the compile flags for this target's objects.
include Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/flags.make

Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/flags.make
Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/includes_C.rsp
Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj: D:/cmake-3.27.7/Tests/RunCMake/pseudo_iwyu.c
Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj"
	cd /d D:\cmake-3.27.7\build\Tests\RunCMake && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj -MF CMakeFiles\pseudo_iwyu.dir\pseudo_iwyu.c.obj.d -o CMakeFiles\pseudo_iwyu.dir\pseudo_iwyu.c.obj -c D:\cmake-3.27.7\Tests\RunCMake\pseudo_iwyu.c

Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.i"
	cd /d D:\cmake-3.27.7\build\Tests\RunCMake && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\cmake-3.27.7\Tests\RunCMake\pseudo_iwyu.c > CMakeFiles\pseudo_iwyu.dir\pseudo_iwyu.c.i

Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.s"
	cd /d D:\cmake-3.27.7\build\Tests\RunCMake && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\cmake-3.27.7\Tests\RunCMake\pseudo_iwyu.c -o CMakeFiles\pseudo_iwyu.dir\pseudo_iwyu.c.s

# Object files for target pseudo_iwyu
pseudo_iwyu_OBJECTS = \
"CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj"

# External object files for target pseudo_iwyu
pseudo_iwyu_EXTERNAL_OBJECTS =

Tests/RunCMake/pseudo_iwyu.exe: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/pseudo_iwyu.c.obj
Tests/RunCMake/pseudo_iwyu.exe: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/build.make
Tests/RunCMake/pseudo_iwyu.exe: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/linkLibs.rsp
Tests/RunCMake/pseudo_iwyu.exe: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/objects1.rsp
Tests/RunCMake/pseudo_iwyu.exe: Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable pseudo_iwyu.exe"
	cd /d D:\cmake-3.27.7\build\Tests\RunCMake && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\pseudo_iwyu.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/build: Tests/RunCMake/pseudo_iwyu.exe
.PHONY : Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/build

Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/clean:
	cd /d D:\cmake-3.27.7\build\Tests\RunCMake && $(CMAKE_COMMAND) -P CMakeFiles\pseudo_iwyu.dir\cmake_clean.cmake
.PHONY : Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/clean

Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\cmake-3.27.7 D:\cmake-3.27.7\Tests\RunCMake D:\cmake-3.27.7\build D:\cmake-3.27.7\build\Tests\RunCMake D:\cmake-3.27.7\build\Tests\RunCMake\CMakeFiles\pseudo_iwyu.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Tests/RunCMake/CMakeFiles/pseudo_iwyu.dir/depend

