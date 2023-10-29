set(EXPECTED_FILES_COUNT "0")

if(NOT RunCMake_SUBTEST_SUFFIX STREQUAL "invalid")
  set(EXPECTED_FILES_COUNT "3")
  set(EXPECTED_FILE_1 "main_component-0.1.1-1.*.rpm")
  set(EXPECTED_FILE_CONTENT_1_LIST "/foo;/foo/CMakeLists.txt")
  set(EXPECTED_FILE_2_COMPONENT "headers")
  set(EXPECTED_FILE_CONTENT_2_LIST "/bar;/bar/CMakeLists.txt")
  set(EXPECTED_FILE_3_COMPONENT "libs")
  set(EXPECTED_FILE_CONTENT_3_LIST "/bas;/bas/CMakeLists.txt")
endif()
