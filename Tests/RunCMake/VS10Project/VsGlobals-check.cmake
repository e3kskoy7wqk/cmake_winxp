macro(check_project_file projectFile)
  if(NOT EXISTS "${projectFile}")
    set(RunCMake_TEST_FAILED "Project file ${projectFile} does not exist.")
    return()
  endif()

  string(REPLACE "${RunCMake_TEST_BINARY_DIR}/" "" projectName ${projectFile})

  set(InsideGlobals FALSE)
  set(DefaultLanguageSet FALSE)
  set(MinimumVisualStudioVersionSet FALSE)
  set(TestPropertySet FALSE)

  file(STRINGS "${projectFile}" lines)
  foreach(line IN LISTS lines)
    if(line MATCHES "^ *<PropertyGroup Label=\"Globals\"> *$")
      set(InsideGlobals TRUE)
    elseif(line MATCHES "^ *<DefaultLanguage>([a-zA-Z\\-]+)</DefaultLanguage> *$")
      if("${CMAKE_MATCH_1}" STREQUAL "en-US")
        if(InsideGlobals)
          message(STATUS "${projectName} has correct DefaultLanguage global property")
          set(DefaultLanguageSet TRUE)
        else()
          message(STATUS "DefaultLanguage is set but not within \"Globals\" property group")
        endif()
      endif()
    elseif(line MATCHES "^ *<MinimumVisualStudioVersion>([0-9\\.]+)</MinimumVisualStudioVersion> *$")
      if("${CMAKE_MATCH_1}" STREQUAL "10.0")
        if(InsideGlobals)
          message(STATUS "${projectName} has correct MinimumVisualStudioVersion global property")
          set(MinimumVisualStudioVersionSet TRUE)
        else()
          message(STATUS "MinimumVisualStudioVersion is set but not within \"Globals\" property group")
        endif()
      endif()
    elseif(line MATCHES "^ *<TestProperty>(.+)</TestProperty> *$")
      if("${CMAKE_MATCH_1}" STREQUAL "TestValue")
        if(InsideGlobals)
          message(STATUS "${projectName} has correct TestProperty global property")
          set(TestPropertySet TRUE)
        else()
          message(STATUS "TestProperty is set but not within \"Globals\" property group")
        endif()
      endif()
    endif()
  endforeach()

  if(NOT DefaultLanguageSet)
    set(RunCMake_TEST_FAILED "DefaultLanguage not found or not set correctly in ${projectName}.")
    return()
  endif()

  if(NOT MinimumVisualStudioVersionSet)
    set(RunCMake_TEST_FAILED "MinimumVisualStudioVersion not found or not set correctly in ${projectName}.")
    return()
  endif()

  if(NOT TestPropertySet)
    set(RunCMake_TEST_FAILED "TestProperty not found or not set correctly in ${projectName}.")
    return()
  endif()
endmacro()

check_project_file("${RunCMake_TEST_BINARY_DIR}/CMakeFiles/${CMAKE_VERSION}/CompilerIdCXX/CompilerIdCXX.vcxproj")
check_project_file("${RunCMake_TEST_BINARY_DIR}/foo.vcxproj")
