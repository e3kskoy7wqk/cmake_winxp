enable_language(CUDA)
if(NOT CMAKE_CUDA_BYTE_ORDER MATCHES "^(BIG_ENDIAN|LITTLE_ENDIAN)$")
  if(CMAKE_OSX_ARCHITECTURES MATCHES ";ppc|ppc;")
    return()
  endif()
  message(FATAL_ERROR "CMAKE_CUDA_BYTE_ORDER has unexpected value '${CMAKE_CUDA_BYTE_ORDER}'")
endif()

include(TestBigEndian)
test_big_endian(IS_BIG_ENDIAN)
if(IS_BIG_ENDIAN AND NOT CMAKE_CUDA_BYTE_ORDER STREQUAL "BIG_ENDIAN")
  message(FATAL_ERROR "test_big_endian result does not match ABI result")
endif()
