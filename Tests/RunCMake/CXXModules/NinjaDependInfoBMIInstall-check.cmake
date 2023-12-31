include("${CMAKE_CURRENT_LIST_DIR}/check-json.cmake")

if (RunCMake_GENERATOR_IS_MULTI_CONFIG)
  set(have_file 0)
  foreach (config IN ITEMS Release Debug RelWithDebInfo MinSizeRel)
    if (NOT EXISTS "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/ninja-bmi-install-public.dir/${config}/CXXDependInfo.json")
      continue ()
    endif ()
    set(have_file 1)

    set(CMAKE_BUILD_TYPE "${config}")

    file(READ "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/ninja-bmi-install-public.dir/${config}/CXXDependInfo.json" actual_contents)
    file(READ "${CMAKE_CURRENT_LIST_DIR}/expect/NinjaDependInfoBMIInstall-public.json" expect_contents)
    check_json("${actual_contents}" "${expect_contents}")

    file(READ "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/ninja-bmi-install-private.dir/${config}/CXXDependInfo.json" actual_contents)
    file(READ "${CMAKE_CURRENT_LIST_DIR}/expect/NinjaDependInfoBMIInstall-private.json" expect_contents)
    check_json("${actual_contents}" "${expect_contents}")
  endforeach ()

  if (NOT have_file)
    list(APPEND RunCMake_TEST_FAILED
      "No recognized build configurations found.")
  endif ()
else ()
  file(READ "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/ninja-bmi-install-public.dir/CXXDependInfo.json" actual_contents)
  file(READ "${CMAKE_CURRENT_LIST_DIR}/expect/NinjaDependInfoBMIInstall-public.json" expect_contents)
  check_json("${actual_contents}" "${expect_contents}")

  file(READ "${RunCMake_TEST_BINARY_DIR}/CMakeFiles/ninja-bmi-install-private.dir/CXXDependInfo.json" actual_contents)
  file(READ "${CMAKE_CURRENT_LIST_DIR}/expect/NinjaDependInfoBMIInstall-private.json" expect_contents)
  check_json("${actual_contents}" "${expect_contents}")
endif ()
