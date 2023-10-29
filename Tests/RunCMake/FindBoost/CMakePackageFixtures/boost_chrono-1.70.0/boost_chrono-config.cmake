# Generated by Boost 1.70.0

if(TARGET Boost::chrono)
  return()
endif()

message(STATUS "Found boost_chrono ${boost_chrono_VERSION} at ${boost_chrono_DIR}")

# Compute the include and library directories relative to this file.
get_filename_component(_BOOST_CMAKEDIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)
get_filename_component(_BOOST_INCLUDEDIR "${_BOOST_CMAKEDIR}/../../include/" ABSOLUTE)
get_filename_component(_BOOST_LIBDIR "${_BOOST_CMAKEDIR}/../" ABSOLUTE)

# Create imported target Boost::chrono
add_library(Boost::chrono UNKNOWN IMPORTED)

set_target_properties(Boost::chrono PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_BOOST_INCLUDEDIR}"
  INTERFACE_COMPILE_DEFINITIONS "BOOST_ALL_NO_LIB"
)

include(${CMAKE_CURRENT_LIST_DIR}/../BoostDetectToolset-1.70.0.cmake)

if(Boost_DEBUG)
  message(STATUS "Scanning ${CMAKE_CURRENT_LIST_DIR}/libboost_chrono-variant*.cmake")
endif()

file(GLOB __boost_variants "${CMAKE_CURRENT_LIST_DIR}/libboost_chrono-variant*.cmake")

macro(_BOOST_SKIPPED fname reason)
  if(Boost_DEBUG)
    message(STATUS "  ... skipped ${fname} (${reason})")
  endif()
  list(APPEND __boost_skipped "${fname} (${reason})")
endmacro()

foreach(f IN LISTS __boost_variants)
  if(Boost_DEBUG)
    message(STATUS "  Including ${f}")
  endif()
  include(${f})
endforeach()

unset(_BOOST_LIBDIR)
unset(_BOOST_INCLUDEDIR)
unset(_BOOST_CMAKEDIR)

get_target_property(__boost_configs Boost::chrono IMPORTED_CONFIGURATIONS)

if(__boost_variants AND NOT __boost_configs)
  message(STATUS "No suitable boost_chrono variant has been identified!")
  if(NOT Boost_DEBUG)
    foreach(s IN LISTS __boost_skipped)
      message(STATUS "  ${s}")
    endforeach()
  endif()
  set(boost_chrono_FOUND 0)
  set(boost_chrono_NOT_FOUND_MESSAGE "No suitable build variant has been found.")
  unset(__boost_skipped)
  unset(__boost_configs)
  unset(__boost_variants)
  unset(_BOOST_CHRONO_DEPS)
  return()
endif()

unset(__boost_skipped)
unset(__boost_configs)
unset(__boost_variants)

if(_BOOST_CHRONO_DEPS)
  list(REMOVE_DUPLICATES _BOOST_CHRONO_DEPS)
  message(STATUS "Adding boost_chrono dependencies: ${_BOOST_CHRONO_DEPS}")
endif()

foreach(dep_boost_chrono IN LISTS _BOOST_CHRONO_DEPS)
  set(_BOOST_QUIET)
  if(boost_chrono_FIND_QUIETLY)
    set(_BOOST_QUIET QUIET)
  endif()
  set(_BOOST_REQUIRED)
  if(boost_chrono_FIND_REQUIRED)
    set(_BOOST_REQUIRED REQUIRED)
  endif()
  get_filename_component(_BOOST_CMAKEDIR "${CMAKE_CURRENT_LIST_DIR}/../" ABSOLUTE)
  find_package(boost_${dep_boost_chrono} 1.70.0 EXACT CONFIG ${_BOOST_REQUIRED} ${_BOOST_QUIET} HINTS ${_BOOST_CMAKEDIR})
  set_property(TARGET Boost::chrono APPEND PROPERTY INTERFACE_LINK_LIBRARIES Boost::${dep_boost_chrono})
  unset(_BOOST_QUIET)
  unset(_BOOST_REQUIRED)
  unset(_BOOST_CMAKEDIR)
  if(NOT boost_${dep_boost_chrono}_FOUND)
    set(boost_chrono_FOUND 0)
    set(boost_chrono_NOT_FOUND_MESSAGE "A required dependency, boost_${dep_boost_chrono}, has not been found.")
    unset(_BOOST_CHRONO_DEPS)
    return()
  endif()
endforeach()

unset(_BOOST_CHRONO_DEPS)
