set(unitybuild_c0 "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/tgt.dir/Unity/unity_0_c.c")
set(unitybuild_c1 "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/tgt.dir/Unity/unity_1_c.c")
if(NOT EXISTS "${unitybuild_c0}")
  set(RunCMake_TEST_FAILED "Generated unity source files ${unitybuild_c0} does not exist.")
  return()
endif()

if(NOT EXISTS "${unitybuild_c1}")
  set(RunCMake_TEST_FAILED "Generated unity source files ${unitybuild_c1} does not exist.")
  return()
endif()
