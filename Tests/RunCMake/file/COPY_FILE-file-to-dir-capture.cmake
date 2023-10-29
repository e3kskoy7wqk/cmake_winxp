set(oldname "${CMAKE_CURRENT_BINARY_DIR}/input")
set(newname "${CMAKE_CURRENT_BINARY_DIR}/output")
file(WRITE "${oldname}" "")
file(MAKE_DIRECTORY "${newname}")
file(COPY_FILE "${oldname}" "${newname}" RESULT result)
message(STATUS "file(COPY_FILE) failed with result: ${result}")
if(NOT EXISTS "${oldname}")
  message(FATAL_ERROR "The old name does not exist:\n ${oldname}")
endif()
