include(RunCMake)

set(RunCMake_TEST_OPTIONS "-DPSEUDO_TIDY=${PSEUDO_TIDY}")

function(run_tidy lang)
  # Use a single build tree for tests without cleaning.
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${lang}-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
  file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
  run_cmake(${lang})

  set(RunCMake_TEST_OUTPUT_MERGE 1)
  run_cmake_command(${lang}-Build ${CMAKE_COMMAND} --build .)
endfunction()

run_tidy(C)
run_tidy(CXX)
if (APPLE)
  run_tidy(OBJC)
  run_tidy(OBJCXX)
endif()
if (NOT RunCMake_GENERATOR STREQUAL "Watcom WMake")
  run_tidy(C-launch)
  run_tidy(CXX-launch)
  if (APPLE)
    run_tidy(OBJC-launch)
    run_tidy(OBJCXX-launch)
  endif()
endif()
run_tidy(C-bad)
run_tidy(compdb)

function(any_file_exists varname)
  foreach(filename IN LISTS ARGN)
    if(EXISTS "${filename}")
      set("${varname}" 1 PARENT_SCOPE)
      return()
    endif()
  endforeach()
  set("${varname}" 0 PARENT_SCOPE)
endfunction()

function(assert_any_file_exists)
  any_file_exists(exists ${ARGN})
  if(NOT exists)
    string(APPEND RunCMake_TEST_FAILED "Expected one of the following files to exist but they do not:\n")
    foreach(filename IN LISTS ARGN)
      string(APPEND RunCMake_TEST_FAILED "  ${filename}\n")
    endforeach()
    set(RunCMake_TEST_FAILED "${RunCMake_TEST_FAILED}" PARENT_SCOPE)
  endif()
endfunction()

function(assert_no_file_exists)
  any_file_exists(exists ${ARGN})
  if(exists)
    string(APPEND RunCMake_TEST_FAILED "Expected none of the following files to exist but one of them does:\n")
    foreach(filename IN LISTS ARGN)
      string(APPEND RunCMake_TEST_FAILED "  ${filename}\n")
    endforeach()
    set(RunCMake_TEST_FAILED "${RunCMake_TEST_FAILED}" PARENT_SCOPE)
  endif()
endfunction()

function(run_tidy_export_fixes)
  # Use a single build tree for tests without cleaning.
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/ExportFixesDir-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
  file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
  run_cmake(ExportFixesDir)

  set(RunCMake_TEST_OUTPUT_MERGE 1)
  run_cmake_command(ExportFixesDir-Build ${CMAKE_COMMAND} --build . --config Debug)
  unset(RunCMake_TEST_OUTPUT_MERGE)

  run_cmake(ExportFixesDir2)

  set(RunCMake_TEST_OUTPUT_MERGE 1)
  run_cmake_command(ExportFixesDir2-Build ${CMAKE_COMMAND} --build . --config Debug)
  unset(RunCMake_TEST_OUTPUT_MERGE)
endfunction()
run_tidy_export_fixes()
