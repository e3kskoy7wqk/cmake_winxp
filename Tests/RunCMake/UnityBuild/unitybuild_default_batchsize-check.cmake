set(unitybuild_c0 "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/tgt.dir/Unity/unity_0_c.c")
file(STRINGS ${unitybuild_c0} unitybuild_c_strings REGEX "/s[0-9]+.c\"$" )
list(LENGTH unitybuild_c_strings number_of_includes)
if(NOT number_of_includes EQUAL 8)
  set(RunCMake_TEST_FAILED "Generated unity doesn't include the expect number of files")
  return()
endif()
