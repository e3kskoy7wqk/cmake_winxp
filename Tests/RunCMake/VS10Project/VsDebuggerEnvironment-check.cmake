foreach(target foo bar)
  set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/${target}.vcxproj")
  if(NOT EXISTS "${vcProjectFile}")
    set(RunCMake_TEST_FAILED "Project file ${vcProjectFile} does not exist.")
    return()
  endif()

  set(debuggerEnvironmentSet FALSE)

  file(STRINGS "${vcProjectFile}" lines)
  foreach(line IN LISTS lines)
    if(line MATCHES "^ *<LocalDebuggerEnvironment[^>]*>([^<>]+)</LocalDebuggerEnvironment>$")
      if("${CMAKE_MATCH_1}" STREQUAL "my-debugger-environment foo")
          message(STATUS "${target}.vcxproj has debugger environment set")
          set(debuggerEnvironmentSet TRUE)
      endif()
    endif()
  endforeach()

  if(NOT debuggerEnvironmentSet)
    set(RunCMake_TEST_FAILED "LocalDebuggerEnvironment not found or not set correctly.")
    return()
  endif()
endforeach()
