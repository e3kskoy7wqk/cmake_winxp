include(RunCMake)

macro(run_cmake_target test subtest target)
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${test}-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  run_cmake_command(${test}-${subtest} ${CMAKE_COMMAND} --build . --target ${target} ${ARGN})

  unset(RunCMake_TEST_BINARY_DIR)
  unset(RunCMake_TEST_NO_CLEAN)
endmacro()

set(RunCMake_TEST_OUTPUT_MERGE TRUE)
if (NOT RunCMake_GENERATOR_IS_MULTI_CONFIG)
  set(RunCMake_TEST_OPTIONS -DCMAKE_BUILD_TYPE=Release)
endif()
run_cmake(AliasTargets)
run_cmake_target(AliasTargets func func --config Release)
run_cmake_target(AliasTargets lib-local lib-local --config Release)
run_cmake_target(AliasTargets main-local main-local --config Release)
run_cmake_target(AliasTargets lib-global lib-global --config Release)
run_cmake_target(AliasTargets main-global main-global --config Release)
run_cmake_target(AliasTargets lib-sub lib-sub --config Release)
run_cmake_target(AliasTargets main-sub main-sub --config Release)
unset(RunCMake_TEST_OPTIONS)
unset(RunCMake_TEST_OUTPUT_MERGE)
