set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/iface.vcxproj")
if(NOT EXISTS "${vcProjectFile}")
  set(RunCMake_TEST_FAILED "Project file ${vcProjectFile} does not exist.")
  return()
endif()

set(found_iface_h 0)
set(found_int_dir 0)
file(STRINGS "${vcProjectFile}" lines)
foreach(line IN LISTS lines)
  if(line MATCHES "<([A-Za-z0-9_]+) +Include=.*iface\\.h")
    set(rule "${CMAKE_MATCH_1}")
    if(NOT rule STREQUAL "None")
      set(RunCMake_TEST_FAILED "iface.h referenced as ${rule} instead of None in\n  ${vcProjectFile}")
      return()
    endif()
    if(found_iface_h)
      set(RunCMake_TEST_FAILED "iface.h referenced multiple times in\n  ${vcProjectFile}")
      return()
    endif()
    set(found_iface_h 1)
  endif()
  if(line MATCHES "^ *<IntDir [^<>]+>[^<>]+</IntDir>")
    set(found_int_dir 1)
  endif()
endforeach()
if(NOT found_iface_h)
  set(RunCMake_TEST_FAILED "iface.h not referenced in\n  ${vcProjectFile}")
  return()
endif()
if(NOT found_int_dir)
  set(RunCMake_TEST_FAILED "No references to IntDir in\n  ${vcProjectFile}")
  return()
endif()
