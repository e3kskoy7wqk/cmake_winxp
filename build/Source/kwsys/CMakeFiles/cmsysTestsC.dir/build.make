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
include Source/kwsys/CMakeFiles/cmsysTestsC.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include Source/kwsys/CMakeFiles/cmsysTestsC.dir/compiler_depend.make

# Include the progress variables for this target.
include Source/kwsys/CMakeFiles/cmsysTestsC.dir/progress.make

# Include the compile flags for this target's objects.
include Source/kwsys/CMakeFiles/cmsysTestsC.dir/flags.make

Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/flags.make
Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/includes_C.rsp
Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj: Source/kwsys/cmsysTestsC.c
Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj -MF CMakeFiles\cmsysTestsC.dir\cmsysTestsC.c.obj.d -o CMakeFiles\cmsysTestsC.dir\cmsysTestsC.c.obj -c D:\cmake-3.27.7\build\Source\kwsys\cmsysTestsC.c

Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.i"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\cmake-3.27.7\build\Source\kwsys\cmsysTestsC.c > CMakeFiles\cmsysTestsC.dir\cmsysTestsC.c.i

Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.s"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\cmake-3.27.7\build\Source\kwsys\cmsysTestsC.c -o CMakeFiles\cmsysTestsC.dir\cmsysTestsC.c.s

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/flags.make
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/includes_C.rsp
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj: D:/cmake-3.27.7/Source/kwsys/testEncode.c
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj -MF CMakeFiles\cmsysTestsC.dir\testEncode.c.obj.d -o CMakeFiles\cmsysTestsC.dir\testEncode.c.obj -c D:\cmake-3.27.7\Source\kwsys\testEncode.c

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cmsysTestsC.dir/testEncode.c.i"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\cmake-3.27.7\Source\kwsys\testEncode.c > CMakeFiles\cmsysTestsC.dir\testEncode.c.i

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cmsysTestsC.dir/testEncode.c.s"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\cmake-3.27.7\Source\kwsys\testEncode.c -o CMakeFiles\cmsysTestsC.dir\testEncode.c.s

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/flags.make
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/includes_C.rsp
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj: D:/cmake-3.27.7/Source/kwsys/testTerminal.c
Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj: Source/kwsys/CMakeFiles/cmsysTestsC.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj -MF CMakeFiles\cmsysTestsC.dir\testTerminal.c.obj.d -o CMakeFiles\cmsysTestsC.dir\testTerminal.c.obj -c D:\cmake-3.27.7\Source\kwsys\testTerminal.c

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing C source to CMakeFiles/cmsysTestsC.dir/testTerminal.c.i"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E D:\cmake-3.27.7\Source\kwsys\testTerminal.c > CMakeFiles\cmsysTestsC.dir\testTerminal.c.i

Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling C source to assembly CMakeFiles/cmsysTestsC.dir/testTerminal.c.s"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && D:\mingw\bin\gcc.exe $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S D:\cmake-3.27.7\Source\kwsys\testTerminal.c -o CMakeFiles\cmsysTestsC.dir\testTerminal.c.s

# Object files for target cmsysTestsC
cmsysTestsC_OBJECTS = \
"CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj" \
"CMakeFiles/cmsysTestsC.dir/testEncode.c.obj" \
"CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj"

# External object files for target cmsysTestsC
cmsysTestsC_EXTERNAL_OBJECTS =

Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/cmsysTestsC.c.obj
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/testEncode.c.obj
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/testTerminal.c.obj
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/build.make
Source/kwsys/cmsysTestsC.exe: Source/kwsys/libcmsys_c.a
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/linkLibs.rsp
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/objects1.rsp
Source/kwsys/cmsysTestsC.exe: Source/kwsys/CMakeFiles/cmsysTestsC.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --bold --progress-dir=D:\cmake-3.27.7\build\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable cmsysTestsC.exe"
	cd /d D:\cmake-3.27.7\build\Source\kwsys && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles\cmsysTestsC.dir\link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
Source/kwsys/CMakeFiles/cmsysTestsC.dir/build: Source/kwsys/cmsysTestsC.exe
.PHONY : Source/kwsys/CMakeFiles/cmsysTestsC.dir/build

Source/kwsys/CMakeFiles/cmsysTestsC.dir/clean:
	cd /d D:\cmake-3.27.7\build\Source\kwsys && $(CMAKE_COMMAND) -P CMakeFiles\cmsysTestsC.dir\cmake_clean.cmake
.PHONY : Source/kwsys/CMakeFiles/cmsysTestsC.dir/clean

Source/kwsys/CMakeFiles/cmsysTestsC.dir/depend:
	$(CMAKE_COMMAND) -E cmake_depends "MinGW Makefiles" D:\cmake-3.27.7 D:\cmake-3.27.7\Source\kwsys D:\cmake-3.27.7\build D:\cmake-3.27.7\build\Source\kwsys D:\cmake-3.27.7\build\Source\kwsys\CMakeFiles\cmsysTestsC.dir\DependInfo.cmake "--color=$(COLOR)"
.PHONY : Source/kwsys/CMakeFiles/cmsysTestsC.dir/depend

