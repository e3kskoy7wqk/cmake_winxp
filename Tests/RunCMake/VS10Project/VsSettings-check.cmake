macro(ensure_props_set projectFile)
  if(NOT EXISTS "${projectFile}")
    set(RunCMake_TEST_FAILED "Project file ${projectFile} does not exist.")
    return()
  endif()

  set(Setting1Found FALSE)
  set(Setting2Found FALSE)

  file(STRINGS "${projectFile}" lines)
  foreach(line IN LISTS lines)
    if(line MATCHES "<SourceProperty1.*Debug.*>SourceProperty1Value</SourceProperty1>")
      message("SourceProperty1 setting found")
      set(Setting1Found TRUE)
    endif()
    if(line MATCHES "<SourceProperty2.*Debug.*>SourceProperty2Value</SourceProperty2>")
      message("SourceProperty2 setting found")
      set(Setting2Found TRUE)
    endif()
  endforeach()

  if (NOT Setting1Found)
    set(RunCMake_TEST_FAILED "SourceProperty1 setting was not found")
    return()
  endif()
  if (NOT Setting2Found)
    set(RunCMake_TEST_FAILED "SourceProperty2 setting was not found")
    return()
  endif()
endmacro()

ensure_props_set("${RunCMake_TEST_BINARY_DIR}/foo.vcxproj")
