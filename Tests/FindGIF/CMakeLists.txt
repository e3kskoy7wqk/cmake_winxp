add_test(NAME FindGIF.Test COMMAND
  ${CMAKE_CTEST_COMMAND} -C $<CONFIGURATION>
  --build-and-test
  "${CMake_SOURCE_DIR}/Tests/FindGIF/Test"
  "${CMake_BINARY_DIR}/Tests/FindGIF/Test"
  ${build_generator_args}
  --build-project TestFindGIF
  --build-options ${build_options}
  --test-command ${CMAKE_CTEST_COMMAND} -V -C $<CONFIGURATION>
  )
