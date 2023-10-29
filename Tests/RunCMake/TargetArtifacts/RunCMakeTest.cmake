include(RunCMake)

function(run_cmake_and_verify_after_build case)
  set(RunCMake_TEST_BINARY_DIR "${RunCMake_BINARY_DIR}/${case}-build")
  if(RunCMake_GENERATOR_IS_MULTI_CONFIG)
    set(RunCMake_TEST_OPTIONS -DCMAKE_CONFIGURATION_TYPES=Debug)
  else()
    set(RunCMake_TEST_OPTIONS -DCMAKE_BUILD_TYPE=Debug)
  endif()
  run_cmake(${case})
  set(RunCMake_TEST_NO_CLEAN 1)
  set(RunCMake_TEST_OUTPUT_MERGE 1)
  run_cmake_command("${case}-build" ${CMAKE_COMMAND} --build .)
endfunction()

if(NOT CMAKE_SYSTEM_NAME STREQUAL "AIX")
  run_cmake_and_verify_after_build(DLL-SOVERSION)
endif()
run_cmake_and_verify_after_build(OutputDirs)
