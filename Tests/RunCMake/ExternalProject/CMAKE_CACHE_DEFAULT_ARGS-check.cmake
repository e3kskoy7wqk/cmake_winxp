set(_cache_file "${RunCMake_TEST_BINARY_DIR}/tmp/FOO-cache-Debug.cmake")

if(NOT EXISTS "${_cache_file}")
  set(RunCMake_TEST_FAILED "Initial cache not created")
  return()
endif()

file(READ "${_cache_file}" _cache)

if(NOT "${_cache}" MATCHES "set\\(FOO \"BAR\".+\\)") # \(\)
  set(RunCMake_TEST_FAILED "Cannot find FOO argument in cache")
  return()
endif()
if("${CMAKE_MATCH_0}" MATCHES FORCE)
  set(RunCMake_TEST_FAILED "Expected not forced FOO argument")
  return()
endif()

if(NOT "${_cache}" MATCHES "set\\(TEST_LIST \"A;B;C\".+\\)")
  set(RunCMake_TEST_FAILED "Cannot find TEST_LIST argument in cache")
  return()
endif()
if("${CMAKE_MATCH_0}" MATCHES FORCE)
  set(RunCMake_TEST_FAILED "Expected not forced TEST_LIST argument")
  return()
endif()

if(NOT "${_cache}" MATCHES "set\\(TEST_OPTIONAL \"TEST_OPTIONAL-NOTFOUND\".+\\)")
  set(RunCMake_TEST_FAILED "Cannot find TEST_OPTIONAL argument in cache")
  return()
endif()
if("${CMAKE_MATCH_0}" MATCHES FORCE)
  set(RunCMake_TEST_FAILED "Expected not forced TEST_OPTIONAL argument")
  return()
endif()

if(NOT "${_cache}" MATCHES "set\\(TEST_OPTIONAL_LAST \"TEST_OPTIONAL_LAST-NOTFOUND\".+\\)")
  set(RunCMake_TEST_FAILED "Cannot find TEST_OPTIONAL_LAST argument in cache")
  return()
endif()
if("${CMAKE_MATCH_0}" MATCHES FORCE)
  set(RunCMake_TEST_FAILED "Expected not forced TEST_OPTIONAL_LAST argument")
  return()
endif()
