file(GLOB test_xml_file "${RunCMake_TEST_BINARY_DIR}/Testing/*/Test.xml")
if(test_xml_file)
  file(READ "${test_xml_file}" test_xml LIMIT 4096)
  if("${test_xml}" MATCHES [[(<Test Status="passed">.*</Test>)]])
    set(test_result "${CMAKE_MATCH_1}")
  endif()
  if(NOT "${test_result}" MATCHES "<Value>.*${TRUNCATED_OUTPUT}.*</Value>")
    set(RunCMake_TEST_FAILED "Test output truncation failed:\n ${test_result}\nExpected: ${TRUNCATED_OUTPUT}")
  endif()
else()
  set(RunCMake_TEST_FAILED "Test.xml not found")
endif()
