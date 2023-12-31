include(RunCMake)

if("${RunCMake_GENERATOR}" MATCHES "^Visual Studio (1[56789])")
  set(vs_major "${CMAKE_MATCH_1}")

  set(RunCMake_GENERATOR_INSTANCE "")
  run_cmake(DefaultInstance)
  set(instance_txt "${RunCMake_BINARY_DIR}/DefaultInstance-build/instance.txt")
  if(EXISTS "${instance_txt}")
    file(READ "${instance_txt}" default_instance)
  endif()

  set(RunCMake_GENERATOR_INSTANCE "${RunCMake_SOURCE_DIR}/instance_does_not_exist")
  run_cmake(MissingInstance)
  set(RunCMake_TEST_OPTIONS -DCMAKE_TOOLCHAIN_FILE=${RunCMake_SOURCE_DIR}/MissingInstance-toolchain.cmake)
  run_cmake(MissingInstanceToolchain)
  unset(RunCMake_TEST_OPTIONS)

  set(RunCMake_GENERATOR_INSTANCE "Test Instance,nocomma")
  run_cmake(BadFieldNoComma)
  set(RunCMake_GENERATOR_INSTANCE "Test Instance,unknown=")
  run_cmake(BadFieldUnknown)
  set(RunCMake_GENERATOR_INSTANCE "Test Instance,version=1.2.3.4,version=1.2.3.4")
  run_cmake(BadFieldDuplicate)
  set(RunCMake_GENERATOR_INSTANCE "version=1.2.3")
  run_cmake(BadVersionFormat1)
  set(RunCMake_GENERATOR_INSTANCE "version=1.2.3.x")
  run_cmake(BadVersionFormat2)
  set(RunCMake_GENERATOR_INSTANCE "version=${vs_major}.999.99999.999")
  run_cmake(BadVersionNumber)
  if(IS_DIRECTORY "${default_instance}")
    set(RunCMake_GENERATOR_INSTANCE "${default_instance},version=${vs_major}.999.99999.999")
    run_cmake(WrongVersion)
  endif()

  set(RunCMake_GENERATOR_INSTANCE "${RunCMake_SOURCE_DIR}")
  run_cmake(PortableNoVersion)
else()
  set(RunCMake_GENERATOR_INSTANCE "")
  run_cmake(NoInstance)

  set(RunCMake_GENERATOR_INSTANCE "Bad Instance")
  run_cmake(BadInstance)

  set(RunCMake_TEST_OPTIONS -DCMAKE_TOOLCHAIN_FILE=${RunCMake_SOURCE_DIR}/BadInstance-toolchain.cmake)
  run_cmake(BadInstanceToolchain)
  unset(RunCMake_TEST_OPTIONS)
endif()
