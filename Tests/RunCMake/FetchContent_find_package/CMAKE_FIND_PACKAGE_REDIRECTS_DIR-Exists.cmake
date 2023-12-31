if(NOT DEFINED CMAKE_FIND_PACKAGE_REDIRECTS_DIR)
  message(FATAL_ERROR "CMAKE_FIND_PACKAGE_REDIRECTS_DIR is not defined")
endif()

if(NOT CMAKE_FIND_PACKAGE_REDIRECTS_DIR STREQUAL "${CMAKE_BINARY_DIR}/CMakeFiles/pkgRedirects")
  message(FATAL_ERROR
    "CMAKE_FIND_PACKAGE_REDIRECTS_DIR has wrong value\n"
    "  Expected: ${CMAKE_BINARY_DIR}/CMakeFiles/pkgRedirects\n"
    "  Actual:   ${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}"
  )
endif()

if(NOT EXISTS "${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}")
  message(FATAL_ERROR
    "Directory CMAKE_FIND_PACKAGE_REDIRECTS_DIR points to does not exist:\n"
    "${CMAKE_FIND_PACKAGE_REDIRECTS_DIR}"
  )
endif()
