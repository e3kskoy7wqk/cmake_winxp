macro(ReadPlatformToolset tgt outvar)
  set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/${tgt}.vcxproj")
  if(NOT EXISTS "${vcProjectFile}")
    set(RunCMake_TEST_FAILED "Project file ${tgt}.vcxproj does not exist.")
    return()
  endif()

  set(HAVE_PlatformToolset 0)

  file(STRINGS "${vcProjectFile}" lines)
  foreach(line IN LISTS lines)
    if(line MATCHES "^ *<PlatformToolset>([^<>]+)</PlatformToolset>")
      set(${outvar} "${CMAKE_MATCH_1}")
      set(HAVE_PlatformToolset 1)
      break()
    endif()
  endforeach()

  if(NOT HAVE_PlatformToolset)
    set(RunCMake_TEST_FAILED "Project file ${tgt}.vcxproj does not have a <PlatformToolset> field.")
    return()
  endif()
endmacro()

ReadPlatformToolset(NormalPlatformToolset NORMAL_TOOLSET)
ReadPlatformToolset(OverridenPlatformToolset OVERRIDEN_TOOLSET)

if (NOT "${OVERRIDEN_TOOLSET}" STREQUAL "MyCustomToolset")
  set(RunCMake_TEST_FAILED "Failed to override the platform toolset")
  return()
endif()

if ("${NORMAL_TOOLSET}" STREQUAL "MyCustomToolset")
  set(RunCMake_TEST_FAILED "Main toolset was overridden (it shouldn't)")
  return()
endif()
