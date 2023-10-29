include(RunCMake)

function(run_linker_launcher lang)
  # Preserve build tree so we can reuse it for the ${lang}-Build subtest below
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${lang}-build)
  set(RunCMake_TEST_NO_CLEAN 1)
  file(REMOVE_RECURSE "${RunCMake_TEST_BINARY_DIR}")
  file(MAKE_DIRECTORY "${RunCMake_TEST_BINARY_DIR}")
  run_cmake(${lang})

  set(RunCMake_TEST_OUTPUT_MERGE 1)
  if("${RunCMake_GENERATOR}" MATCHES "Ninja")
    set(verbose_args -- -v)
  endif()
  run_cmake_command(${lang}-Build ${CMAKE_COMMAND} --build . ${verbose_args})
endfunction()

function(run_linker_launcher_env lang)
  string(REGEX REPLACE "-.*" "" core_lang "${lang}")
  # Use the noop genexp $<PATH:...> genexp to validate genexp support.
  set(ENV{CMAKE_${core_lang}_LINKER_LAUNCHER} "$<PATH:CMAKE_PATH,${CMAKE_COMMAND}>;-E;env;USED_LAUNCHER=1;TARGET_NAME=$<TARGET_PROPERTY:NAME>;LANGUAGE=$<LINK_LANGUAGE>")
  run_linker_launcher(${lang})
  unset(ENV{CMAKE_${core_lang}_LINKER_LAUNCHER})
endfunction()

set(langs C CXX)
if(CMake_TEST_OBJC)
  list(APPEND langs OBJC OBJCXX)
endif()

foreach(lang ${langs})
  run_linker_launcher(${lang})
  run_linker_launcher_env(${lang}-env)
  if(NOT RunCMake_GENERATOR STREQUAL "Watcom WMake")
    run_linker_launcher(${lang}-launch)
    run_linker_launcher_env(${lang}-launch-env)
  endif()
endforeach()
