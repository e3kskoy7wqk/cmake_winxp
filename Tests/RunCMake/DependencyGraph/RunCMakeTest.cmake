include(RunCMake)

function(check_files dir)
  set(expected ${ARGN})
  list(FILTER expected EXCLUDE REGEX "^$")
  list(REMOVE_DUPLICATES expected)
  list(SORT expected)

  file(GLOB_RECURSE glob "${dir}/*")
  set(actual)
  foreach(i IN LISTS glob)
    if(NOT i MATCHES "(\\.manifest$)|(\\.exp$)|(\\.tds$)")
      get_filename_component(real_path ${i} REALPATH)
      list(APPEND actual ${real_path})
    endif()
  endforeach()
  list(REMOVE_DUPLICATES actual)
  list(SORT actual)

  if(NOT "${expected}" STREQUAL "${actual}")
    string(REPLACE ";" "\n  " expected_formatted "${expected}")
    string(REPLACE ";" "\n  " actual_formatted "${actual}")
    string(APPEND RunCMake_TEST_FAILED "Actual files did not match expected\nExpected:\n  ${expected_formatted}\nActual:\n  ${actual_formatted}\n")
  endif()

  set(RunCMake_TEST_FAILED "${RunCMake_TEST_FAILED}" PARENT_SCOPE)
endfunction()

function(run_cmake_build name)
  set(RunCMake_TEST_NO_CLEAN TRUE)
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${name}-build)
  file(REMOVE_RECURSE ${RunCMake_TEST_BINARY_DIR})
  if(NOT RunCMake_GENERATOR_IS_MULTI_CONFIG)
    list(APPEND RunCMake_TEST_OPTIONS -DCMAKE_BUILD_TYPE=Release)
  endif()
  run_cmake(${name})
  set(RunCMake_TEST_OPTIONS)
  run_cmake_command(${name}-build ${CMAKE_COMMAND}
    --build ${RunCMake_TEST_BINARY_DIR}
    --config Release
    --target ${ARGN})
endfunction()

function(run_optimize_test name)
  set(RunCMake_TEST_OPTIONS)
  run_cmake_build(${name}-none ${ARGN})
  set(RunCMake_TEST_OPTIONS -DOPTIMIZE_TOP=TRUE)
  run_cmake_build(${name}-top ${ARGN})
  set(RunCMake_TEST_OPTIONS -DOPTIMIZE_MIDDLE=TRUE)
  run_cmake_build(${name}-middle ${ARGN})
  set(RunCMake_TEST_OPTIONS -DOPTIMIZE_TOP=TRUE -DOPTIMIZE_MIDDLE=TRUE)
  run_cmake_build(${name}-both ${ARGN})
endfunction()

run_cmake(Property)

run_optimize_test(OptimizeShared SharedTop)
run_optimize_test(OptimizeStatic StaticTop)
if(CMAKE_Fortran_COMPILER)
  run_optimize_test(OptimizeFortran FortranTop)
endif()
