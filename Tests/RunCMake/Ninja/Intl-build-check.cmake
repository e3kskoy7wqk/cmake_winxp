include(${RunCMake_SOURCE_DIR}/Intl-common.cmake)
set(output "${RunCMake_TEST_BINARY_DIR}/${intl}-output.txt")
if(NOT EXISTS "${output}")
  set(RunCMake_TEST_FAILED "Expected output does not exist:\n ${output}")
endif()
