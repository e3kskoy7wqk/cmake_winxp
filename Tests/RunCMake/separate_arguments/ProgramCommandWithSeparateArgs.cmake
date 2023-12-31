
separate_arguments (out UNIX_COMMAND PROGRAM SEPARATE_ARGS "xx a b c")
if (out)
  message (SEND_ERROR "unexpected result with nonexistent program")
endif()

set (TEST_EXE_DIR "${CMAKE_CURRENT_BINARY_DIR}/TestExe")
file(MAKE_DIRECTORY "${TEST_EXE_DIR}")
file(COPY "${CMAKE_COMMAND}" DESTINATION "${TEST_EXE_DIR}")
cmake_path (GET CMAKE_COMMAND FILENAME cmake_exe)

set (ENV{PATH} "${TEST_EXE_DIR}")

separate_arguments (out UNIX_COMMAND PROGRAM SEPARATE_ARGS "${cmake_exe} a b c")
list (LENGTH out length)
if (length EQUAL 0)
  message(FATAL_ERROR "existent program not found")
endif()
if (NOT length EQUAL 4)
  message(FATAL_ERROR "unexpected arguments")
endif()
list(POP_FRONT out cmake)
if (NOT cmake STREQUAL "${TEST_EXE_DIR}/${cmake_exe}")
  message (SEND_ERROR "bad path for program: '${cmake}' instead of '${TEST_EXE_DIR}/${cmake_exe}'")
endif()
if (NOT out STREQUAL "a;b;c")
  message (SEND_ERROR "bad path for args: '${out}' instead of 'a;b;c'")
endif()
