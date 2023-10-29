set(THIRD_PARTY_REGEX "<Subproject name=\"MyThirdPartyDependency\">.*<Label>MyThirdPartyDependency</Label>.*</Subproject>")
set(SUBPROJECTS_REGEX "${THIRD_PARTY_REGEX}")

file(GLOB configure_xml_file "${RunCMake_TEST_BINARY_DIR}/Testing/*/Configure.xml")
if(configure_xml_file)
  file(READ "${configure_xml_file}" configure_xml)
  if(NOT configure_xml MATCHES "${SUBPROJECTS_REGEX}.*<Configure>")
     set(RunCMake_TEST_FAILED "Configure.xml does not contain the expected list of subprojects")
  endif()
else()
  set(RunCMake_TEST_FAILED "Configure.xml not found")
endif()

file(GLOB build_xml_file "${RunCMake_TEST_BINARY_DIR}/Testing/*/Build.xml")
if(build_xml_file)
  file(READ "${build_xml_file}" build_xml)
  set(BUILD_ERROR_REGEX "<Failure type=\"Error\">.*<Labels>.*<Label>MyThirdPartyDependency</Label>.*<Label>NotASubproject</Label>.*</Labels>")
  if(NOT build_xml MATCHES "${SUBPROJECTS_REGEX}.*<Build>.*${BUILD_ERROR_REGEX}.*</Build>")
    set(RunCMake_TEST_FAILED "Build.xml does not contain the expected list of subprojects and labels")
  endif()
else()
  set(RunCMake_TEST_FAILED "Build.xml not found")
endif()

file(GLOB test_xml_file "${RunCMake_TEST_BINARY_DIR}/Testing/*/Test.xml")
if(test_xml_file)
  file(READ "${test_xml_file}" test_xml)
  set(TEST_NOTRUN_REGEX "<Test Status=\"notrun\">.*<Labels>.*<Label>MyThirdPartyDependency</Label>.*<Label>NotASubproject</Label>.*</Labels>")
  if(NOT test_xml MATCHES "${SUBPROJECTS_REGEX}.*<Testing>.*${TEST_FAILED_REGEX}.*${TEST_PASSED_REGEX}.*${TEST_NOTRUN_REGEX}.*</Testing>")
    set(RunCMake_TEST_FAILED "Test.xml does not contain the expected list of subprojects and labels")
  endif()
else()
  set(RunCMake_TEST_FAILED "${CTEST_BINARY_DIRECTORY}/Testing/*/Test.xml not found")
endif()
