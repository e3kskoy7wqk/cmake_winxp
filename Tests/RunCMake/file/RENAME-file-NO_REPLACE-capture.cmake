set(oldname "${CMAKE_CURRENT_BINARY_DIR}/input")
set(newname "${CMAKE_CURRENT_BINARY_DIR}/output")
file(WRITE "${oldname}" "a")
file(WRITE "${newname}" "b")
file(RENAME "${oldname}" "${newname}" NO_REPLACE RESULT result)
message(STATUS "file(RENAME) failed with result: ${result}")
if(NOT EXISTS "${oldname}")
  message(FATAL_ERROR "The old name does not still exist:\n ${oldname}")
endif()
