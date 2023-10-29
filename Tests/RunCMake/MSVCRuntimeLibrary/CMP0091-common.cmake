enable_language(C)

cmake_policy(GET CMP0091 cmp0091)
if(cmp0091 STREQUAL "NEW")
  if(NOT CMAKE_MSVC_RUNTIME_LIBRARY_DEFAULT)
    message(SEND_ERROR "CMAKE_MSVC_RUNTIME_LIBRARY_DEFAULT not set under NEW behavior")
  endif()
else()
  if(CMAKE_MSVC_RUNTIME_LIBRARY_DEFAULT)
    message(SEND_ERROR "CMAKE_MSVC_RUNTIME_LIBRARY_DEFAULT is set under OLD behavior")
  endif()
endif()

if(CMAKE_C_COMPILER_ID STREQUAL "MSVC")
  if(CMAKE_C_FLAGS_DEBUG MATCHES "[/-]MDd( |$)")
    set(have_MDd 1)
  else()
    set(have_MDd 0)
  endif()
  if(CMAKE_C_FLAGS_RELEASE MATCHES "[/-]MD( |$)")
    set(have_MD 1)
  else()
    set(have_MD 0)
  endif()
  if(cmp0091 STREQUAL "NEW")
    if(have_MDd OR have_MD)
      message(SEND_ERROR "Have a -MD* flag under NEW behavior.")
    endif()
  else()
    if(NOT (have_MDd AND have_MD))
      message(SEND_ERROR "Do not have -MD* flags under OLD behavior.")
    endif()
  endif()
endif()

set(CMAKE_MSVC_RUNTIME_LIBRARY BogusValue)
add_library(foo empty.c)
