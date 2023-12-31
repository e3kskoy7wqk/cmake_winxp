if(NOT "${VersionTestC_FIND_VERSION}" STREQUAL "1.2.3")
  message(SEND_ERROR "VersionTestC_FIND_VERSION=${VersionTestC_FIND_VERSION} is not 1.2.3")
endif()
if(NOT "${VersionTestC_FIND_VERSION_MAJOR}" STREQUAL "1")
  message(SEND_ERROR "VersionTestC_FIND_VERSION_MAJOR=${VersionTestC_FIND_VERSION_MAJOR} is not 1")
endif()
if(NOT "${VersionTestC_FIND_VERSION_MINOR}" STREQUAL "2")
  message(SEND_ERROR "VersionTestC_FIND_VERSION_MINOR=${VersionTestC_FIND_VERSION_MINOR} is not 2")
endif()
if(NOT "${VersionTestC_FIND_VERSION_PATCH}" STREQUAL "3")
  message(SEND_ERROR "VersionTestC_FIND_VERSION_PATCH=${VersionTestC_FIND_VERSION_PATCH} is not 3")
endif()
if(NOT "${VersionTestC_FIND_VERSION_TWEAK}" STREQUAL "0")
  message(SEND_ERROR "VersionTestC_FIND_VERSION_TWEAK=${VersionTestC_FIND_VERSION_TWEAK} is not 0")
endif()
if(NOT "${VersionTestC_FIND_VERSION_COUNT}" STREQUAL "3")
  message(SEND_ERROR "VersionTestC_FIND_VERSION_COUNT=${VersionTestC_FIND_VERSION_COUNT} is not 3")
endif()
