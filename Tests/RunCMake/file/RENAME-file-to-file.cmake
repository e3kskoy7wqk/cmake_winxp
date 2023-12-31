set(oldname "${CMAKE_CURRENT_BINARY_DIR}/input")
set(newname "${CMAKE_CURRENT_BINARY_DIR}/output")
file(WRITE "${oldname}" "")
file(RENAME "${oldname}" "${newname}")
if(EXISTS "${oldname}")
  message(FATAL_ERROR "The old name still exists:\n ${oldname}")
endif()
if(NOT EXISTS "${newname}")
  message(FATAL_ERROR "The new name does not exist:\n ${newname}")
endif()
