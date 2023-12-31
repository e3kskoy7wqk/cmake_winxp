set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/foo.vcxproj")
if(NOT EXISTS "${vcProjectFile}")
  set(RunCMake_TEST_FAILED "Project file ${vcProjectFile} does not exist.")
  return()
endif()

set(propertyFound FALSE)
file(STRINGS "${vcProjectFile}" lines)
foreach(line IN LISTS lines)
  if(line MATCHES "^ *<CompileAsManaged>(.*)</CompileAsManaged>$")
    set(propertyFound TRUE)
    set(expectedValue "Safe")
    set(actualValue ${CMAKE_MATCH_1})
    if(NOT (${actualValue} STREQUAL ${expectedValue}))
      set(RunCMake_TEST_FAILED "CompileAsManaged \"${actualValue}\" differs from expected value \"${expectedValue}\".")
      return()
    endif()
  endif()
endforeach()

if(NOT propertyFound)
  set(RunCMake_TEST_FAILED "Property CompileAsManaged not found in project file.")
  return()
endif()
