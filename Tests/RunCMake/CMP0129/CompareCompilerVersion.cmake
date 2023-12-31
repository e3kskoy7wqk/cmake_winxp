function(compare_compiler_version lang)
  cmake_policy(GET CMP0129 LCC_FALLBACK_MODE)
  if(${CMAKE_${lang}_COMPILER} STREQUAL "LCC" OR ${CMAKE_${lang}_COMPILER} STREQUAL "GNU")
    execute_process(COMMAND ${CMAKE_${lang}_COMPILER} --version OUTPUT_VARIABLE output)
    if("${output}" MATCHES [[lcc:([0-9]+.[0-9]+.([0-9]+)):]])
      set(native_version ${CMAKE_MATCH_1})
    else()
      message(FATAL_ERROR "Can not identify native LCC version for language ${lang}.")
    endif()
    if("${output}" MATCHES [[\(GCC\) ([0-9]+.[0-9]+.([0-9]+)) compatible]])
      set(simulated_version ${CMAKE_MATCH_1})
    else()
      message(FATAL_ERROR "Can not identify simulated GNU version for language ${lang}.")
    endif()
    message(STATUS "Compiler native version is ${native_version}, simulated version is ${simulated_version}.")
    if("${LCC_FALLBACK_MODE}" STREQUAL "NEW")
      if(NOT "${CMAKE_${lang}_COMPILER_ID}" STREQUAL "LCC")
        message(FATAL_ERROR "Policy is in NEW mode, but compiler identification is ${CMAKE_${lang}_COMPILER_ID} instead of LCC.")
      endif()
      if(NOT "${CMAKE_${lang}_COMPILER_VERSION}" STREQUAL "${native_version}")
        message(FATAL_ERROR "Policy is in NEW mode, but compiler version is ${CMAKE_${lang}_COMPILER_VERSION} instead of ${native_version}.")
      endif()
      if(NOT "${CMAKE_${lang}_SIMULATE_ID}" STREQUAL "GNU")
        message(FATAL_ERROR "Policy is in NEW mode, but simulated compiler identification is ${CMAKE_${lang}_SIMULATE_ID} instead of GNU.")
      endif()
      if(NOT "${CMAKE_${lang}_SIMULATE_VERSION}" STREQUAL "${simulated_version}")
        message(FATAL_ERROR "Policy is in NEW mode, but simulated compiler version is ${CMAKE_${lang}_SIMULATE_VERSION} instead of ${simulated_version}.")
      endif()
    else()
      if(NOT "${CMAKE_${lang}_COMPILER_ID}" STREQUAL "GNU")
        message(FATAL_ERROR "Policy is in OLD mode, but compiler identification is ${CMAKE_${lang}_COMPILER_ID} instead of GNU.")
      endif()
      if(NOT "${CMAKE_${lang}_COMPILER_VERSION}" STREQUAL "${simulated_version}")
        message(FATAL_ERROR "Policy is in OLD mode, but compiler version is ${CMAKE_${lang}_COMPILER_VERSION} instead of ${simulated_version}.")
      endif()
      if(${CMAKE_${lang}_SIMULATE_VERSION} OR ${CMAKE_${lang}_SIMULATE_ID)
        message(FATAL_ERROR "Policy is in OLD mode, but simulated compiler ID/version is ${CMAKE_${lang}_COMPILER_ID}/${CMAKE_${lang}_COMPILER_VERSION} instead of undefined.")
      endif()
    endif()
  endif()
endfunction()
