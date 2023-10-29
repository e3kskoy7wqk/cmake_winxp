macro(RuntimeLibrary_check tgt rtl_expect)
  set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/${tgt}.vcxproj")
  if(NOT EXISTS "${vcProjectFile}")
    set(RunCMake_TEST_FAILED "Project file ${tgt}.vcxproj does not exist.")
    return()
  endif()

  set(HAVE_Runtimelibrary 0)

  file(STRINGS "${vcProjectFile}" lines)
  foreach(line IN LISTS lines)
    if(line MATCHES "^ *<RuntimeLibrary>([^<>]+)</RuntimeLibrary>")
      set(rtl_actual "${CMAKE_MATCH_1}")
      if(NOT "${rtl_actual}" STREQUAL "${rtl_expect}")
        set(RunCMake_TEST_FAILED "Project file ${tgt}.vcxproj has RuntimeLibrary '${rtl_actual}', not '${rtl_expect}'.")
        return()
      endif()
      set(HAVE_Runtimelibrary 1)
      break()
    endif()
  endforeach()

  if(NOT HAVE_Runtimelibrary AND NOT "${rtl_expect}" STREQUAL "")
    set(RunCMake_TEST_FAILED "Project file ${tgt}.vcxproj does not have a RuntimeLibrary field.")
    return()
  endif()
endmacro()

RuntimeLibrary_check(default-C MultiThreadedDebugDLL)
RuntimeLibrary_check(default-CXX MultiThreadedDebugDLL)
RuntimeLibrary_check(empty-C "")
RuntimeLibrary_check(empty-CXX "")
RuntimeLibrary_check(MTd-C MultiThreadedDebug)
RuntimeLibrary_check(MTd-CXX MultiThreadedDebug)
RuntimeLibrary_check(MT-C MultiThreaded)
RuntimeLibrary_check(MT-CXX MultiThreaded)
