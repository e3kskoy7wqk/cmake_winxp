
# show the effect of the exclusion or inclusion of the upper endpoint

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}")

set (VersionRange_SPECIFIED_VERSION_COMPLETE 2.3.4.5...2.3.4.5)
set (VersionRange_SPECIFIED_VERSION_RANGE 2.3.4.5...2.3.4.5)
set (VersionRange_SPECIFIED_VERSION_MIN 2.3.4.5)
set (VersionRange_SPECIFIED_VERSION_MIN_MAJOR 2)
set (VersionRange_SPECIFIED_VERSION_MIN_MINOR 3)
set (VersionRange_SPECIFIED_VERSION_MIN_PATCH 4)
set (VersionRange_SPECIFIED_VERSION_MIN_TWEAK 5)
set (VersionRange_SPECIFIED_VERSION_MAX 2.3.4.5)
set (VersionRange_SPECIFIED_VERSION_MAX_MAJOR 2)
set (VersionRange_SPECIFIED_VERSION_MAX_MINOR 3)
set (VersionRange_SPECIFIED_VERSION_MAX_PATCH 4)
set (VersionRange_SPECIFIED_VERSION_MAX_TWEAK 5)

find_package (VersionRange ${VersionRange_SPECIFIED_VERSION_RANGE})

if (NOT VersionRange_FOUND)
  message (FATAL_ERROR "Package VersionRange not found.")
endif()

if (NOT VersionRange_VERSION VERSION_EQUAL "2.3.4.5")
  message (SEND_ERROR "Wrong version : ${VersionRange_VERSION}")
endif()
if (NOT VersionRange_VERSION_MAJOR VERSION_EQUAL "2")
  message (SEND_ERROR "Wrong major version : ${VersionRange_VERSION_MAJOR}")
endif()
if (NOT VersionRange_VERSION_MINOR VERSION_EQUAL "3")
  message (SEND_ERROR "Wrong minor version : ${VersionRange_VERSION_MINOR}")
endif()
if (NOT VersionRange_VERSION_PATCH VERSION_EQUAL "4")
  message (SEND_ERROR "Wrong patch version : ${VersionRange_VERSION_PATCH}")
endif()
if (NOT VersionRange_VERSION_TWEAK VERSION_EQUAL "5")
  message (SEND_ERROR "Wrong tweak version : ${VersionRange_VERSION_TWEAK}")
endif()
