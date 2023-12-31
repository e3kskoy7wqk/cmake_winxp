set(xcProjectFile "${RunCMake_TEST_BINARY_DIR}/SearchPaths.xcodeproj/project.pbxproj")
if(NOT EXISTS "${xcProjectFile}")
  set(RunCMake_TEST_FAILED "Project file ${xcProjectFile} does not exist.")
  return()
endif()

set(relevant_lines "")
set(found_project_FRAMEWORK_SEARCH_PATHS 0)
set(found_target_both_FRAMEWORK_SEARCH_PATHS 0)
set(found_target_include_FRAMEWORK_SEARCH_PATHS 0)
set(found_target_library_FRAMEWORK_SEARCH_PATHS 0)
set(found_inherited_FRAMEWORK_SEARCH_PATHS 0)
set(found_project_LIBRARY_SEARCH_PATHS 0)
set(found_target_library_LIBRARY_SEARCH_PATHS 0)
set(found_target_cmp0142old_LIBRARY_SEARCH_PATHS 0)
set(found_target_cmp0142new_LIBRARY_SEARCH_PATHS 0)
set(found_inherited_LIBRARY_SEARCH_PATHS 0)
file(STRINGS "${xcProjectFile}" lines)
foreach(line IN LISTS lines)
  if(line MATCHES [[FRAMEWORK_SEARCH_PATHS]])
    string(APPEND relevant_lines "  ${line}\n")
    if(line MATCHES [[FRAMEWORK_SEARCH_PATHS = "[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/ProjectSearchPath";]])
      set(found_project_FRAMEWORK_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[FRAMEWORK_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathInc(\\")?","(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathLib(\\")?","\$\(inherited\)"\);]])
      set(found_target_both_FRAMEWORK_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[FRAMEWORK_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathInc(\\")?","\$\(inherited\)"\);]])
      set(found_target_include_FRAMEWORK_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[FRAMEWORK_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathLib(\\")?","\$\(inherited\)"\);]])
      set(found_target_library_FRAMEWORK_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[FRAMEWORK_SEARCH_PATHS = \("\$\(inherited\)"\);]])
      set(found_inherited_FRAMEWORK_SEARCH_PATHS 1)
    endif()
  endif()

  if(line MATCHES [[LIBRARY_SEARCH_PATHS]])
    string(APPEND relevant_lines "  ${line}\n")
    if(line MATCHES [[LIBRARY_SEARCH_PATHS = "[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/ProjectSearchPath";]])
      set(found_project_LIBRARY_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[LIBRARY_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathLib/\$\(CONFIGURATION\)\$\(EFFECTIVE_PLATFORM_NAME\)(\\")?","(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathLib(\\")?","\$\(inherited\)"\);]])
      set(found_target_library_LIBRARY_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[LIBRARY_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathCMP0142OLD/\$\(CONFIGURATION\)\$\(EFFECTIVE_PLATFORM_NAME\)(\\")?","(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathCMP0142OLD(\\")?","\$\(inherited\)"\);]])
      set(found_target_cmp0142old_LIBRARY_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[LIBRARY_SEARCH_PATHS = \("(\\")?[^"]*/Tests/RunCMake/XcodeProject/SearchPaths-build/TargetSearchPathCMP0142NEW(\\")?","\$\(inherited\)"\);]])
      set(found_target_cmp0142new_LIBRARY_SEARCH_PATHS 1)
    endif()
    if(line MATCHES [[LIBRARY_SEARCH_PATHS = \("\$\(inherited\)"\);]])
      set(found_inherited_LIBRARY_SEARCH_PATHS 1)
    endif()
  endif()
endforeach()
if(NOT found_project_FRAMEWORK_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected FRAMEWORK_SEARCH_PATHS for project in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_both_FRAMEWORK_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected FRAMEWORK_SEARCH_PATHS for target 'both' in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_include_FRAMEWORK_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for target 'include' in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_library_FRAMEWORK_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for target 'library' in\n  ${xcProjectFile}\n")
endif()
if(found_inherited_FRAMEWORK_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Found unexpected LIBRARY_SEARCH_PATHS inherited-only value in\n  ${xcProjectFile}\n")
endif()
if(NOT found_project_LIBRARY_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for project in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_library_LIBRARY_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for target 'library' in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_cmp0142old_LIBRARY_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for target 'cmp0142old' in\n  ${xcProjectFile}\n")
endif()
if(NOT found_target_cmp0142new_LIBRARY_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Did not find expected LIBRARY_SEARCH_PATHS for target 'cmp0142new' in\n  ${xcProjectFile}\n")
endif()
if(found_inherited_LIBRARY_SEARCH_PATHS)
  string(APPEND RunCMake_TEST_FAILED "Found unexpected LIBRARY_SEARCH_PATHS inherited-only value in\n  ${xcProjectFile}\n")
endif()
if(RunCMake_TEST_FAILED)
  string(APPEND RunCMake_TEST_FAILED "Relevant lines include\n${relevant_lines}")
endif()
