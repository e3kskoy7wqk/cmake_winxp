set(whitespaces_ "[\t\n\r ]*")

if(GENERATOR_TYPE STREQUAL "RPM")
  set(NAME "Debuginfo")
  set(DEBUG_SUFFIX "debuginfo")
  set(PKG "rpm")
  set(DEBUG_PKG "rpm")
elseif(GENERATOR_TYPE STREQUAL "DEB")
  set(NAME "debuginfo")
  set(DEBUG_SUFFIX "dbgsym")
  set(PKG "deb")
  set(DEBUG_PKG "ddeb")
endif()

set(EXPECTED_FILES_NAME_GENERATOR_SPECIFIC_FORMAT TRUE)

if(PACKAGING_TYPE STREQUAL "COMPONENT")
  set(EXPECTED_FILES_COUNT "6")

  set(EXPECTED_FILE_1_NAME "${NAME}")
  set(EXPECTED_FILE_1_COMPONENT "applications")
  set(EXPECTED_FILE_CONTENT_1_LIST "/foo;/foo/test_prog")

  set(EXPECTED_FILE_2 "TestDinfo-pkg*-headers.${PKG}")
  set(EXPECTED_FILE_CONTENT_2_LIST "/bar;/bar/CMakeLists.txt")

  set(EXPECTED_FILE_3 "TestDinfo-pkg*-libs.${PKG}")
  set(EXPECTED_FILE_CONTENT_3_LIST "/bas;/bas/libtest_lib.so")

  set(EXPECTED_FILE_4 "${NAME}-applications-${DEBUG_SUFFIX}*.${DEBUG_PKG}")
  if(GENERATOR_TYPE STREQUAL "RPM")
    set(EXPECTED_FILE_CONTENT_4 ".*/src${whitespaces_}/src/src_1${whitespaces_}/src/src_1/main.cpp.*\.debug.*")
  elseif(GENERATOR_TYPE STREQUAL "DEB")
    set(EXPECTED_FILE_CONTENT_4 ".*/usr/lib/debug/.build-id/.*\.debug.*")
  endif()

  if(GENERATOR_TYPE STREQUAL "RPM")
    set(EXPECTED_FILE_5 "libs-DebugInfoPackage.rpm")
    set(EXPECTED_FILE_CONTENT_5 ".*/src${whitespaces_}/src/src_1${whitespaces_}/src/src_1/test_lib.cpp.*\.debug.*")
  elseif(GENERATOR_TYPE STREQUAL "DEB")
    set(EXPECTED_FILE_5 "TestDinfo-pkg-libs-dbgsym.ddeb")
    set(EXPECTED_FILE_CONTENT_5 ".*/usr/lib/debug/.build-id/.*\.debug.*")
  endif()

  set(EXPECTED_FILE_6 "TestDinfo-pkg*-appheaders.${PKG}")
  set(EXPECTED_FILE_CONTENT_6_LIST "/include;/include/test_lib.hpp")

elseif(PACKAGING_TYPE STREQUAL "MONOLITHIC" AND GENERATOR_TYPE STREQUAL "DEB")
  set(EXPECTED_FILES_COUNT "2")

  set(EXPECTED_FILE_1 "TestDinfo-pkg.deb")
  set(
    EXPECTED_FILE_CONTENT_1_LIST
    "/bar;/bar/CMakeLists.txt;/bas;/bas/libtest_lib.so;/foo;/foo/test_prog;/include;/include/test_lib.hpp"
  )

  set(EXPECTED_FILE_2 "TestDinfo-pkg-dbgsym.ddeb")
  set(EXPECTED_FILE_CONTENT_2 ".*/usr/lib/debug/.build-id/.*\.debug.*")

endif()
