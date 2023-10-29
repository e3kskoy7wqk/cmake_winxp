if (NOT TEST_SOURCE)
  set(TEST_SOURCE "${TEST}")
endif ()

set(make_program "D:/mingw/bin/mingw32-make.exe")
if(make_program)
  set(maybe_make_program "-DCMAKE_MAKE_PROGRAM=${make_program}")
endif()

set(_isMultiConfig "0")
if(_isMultiConfig)
  set(cfg_opts "-DCMAKE_CONFIGURATION_TYPES=Debug\\;Release\\;RelWithDebInfo")
else()
  set(cfg_opts)
endif()

set(source_dir "D:/cmake-3.27.7/Tests/CMakeOnly/${TEST_SOURCE}")
set(binary_dir "D:/cmake-3.27.7/build/Tests/CMakeOnly/${TEST}-build")
file(REMOVE_RECURSE "${binary_dir}")
file(MAKE_DIRECTORY "${binary_dir}")
execute_process(
  COMMAND  ${CMAKE_COMMAND} ${CMAKE_ARGS}
  "${source_dir}" -G "MinGW Makefiles"
  -A ""
  -T ""
  ${cfg_opts}
  ${maybe_make_program}
  WORKING_DIRECTORY "${binary_dir}"
  RESULT_VARIABLE result
  )
if(result)
  message(FATAL_ERROR "CMake failed to configure ${TEST}")
endif()
