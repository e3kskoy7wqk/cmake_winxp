if(DEFINED CMAKE_GET_OS_RELEASE_FALLBACK_RESULT)
  message(FATAL_ERROR "The `CMAKE_GET_OS_RELEASE_FALLBACK_RESULT` expected to be unset at this moment")
endif()

set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_NAME UnitTest)
set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_PRETTY_NAME "Just a Unit Test")
set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_ID unittest)
set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_ID_LIKE nothing)
set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_VERSION 0.0.1)
set(CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_VERSION_ID 0.0.1)

list(
    APPEND CMAKE_GET_OS_RELEASE_FALLBACK_RESULT
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_NAME
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_PRETTY_NAME
    IGNORED_VARIABLE_NAME_WHICH_IS_NOT_STARTED_WITH_EXPECTED_PREFIX
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_ID
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_ID_LIKE
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_VERSION
    CMAKE_GET_OS_RELEASE_FALLBACK_RESULT_VERSION_ID
  )
