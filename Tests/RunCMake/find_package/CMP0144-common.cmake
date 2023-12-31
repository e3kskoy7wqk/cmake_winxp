# (includer selects CMP0144)
list(INSERT CMAKE_MODULE_PATH 0 ${CMAKE_CURRENT_SOURCE_DIR}/PackageRoot)
set(PackageRoot_BASE ${CMAKE_CURRENT_SOURCE_DIR}/PackageRoot)

function(PrintPath label path)
  string(REPLACE "${PackageRoot_BASE}" "<base>" out "${path}")
  message("${label} ${out}")
endfunction()

macro(RunTestCase)
  message("----------")
  PrintPath("FOO_ROOT     :" "'${FOO_ROOT}'")
  PrintPath("ENV{FOO_ROOT}:" "'$ENV{FOO_ROOT}'")
  message("")

  find_package(Foo)
  message("find_package(Foo)")
  PrintPath("FOO_TEST_FILE_FOO:" "${FOO_TEST_FILE_FOO}")
  PrintPath("FOO_TEST_FILE_ZOT:" "${FOO_TEST_FILE_ZOT}")
  PrintPath("FOO_TEST_PATH_FOO:" "${FOO_TEST_PATH_FOO}")
  PrintPath("FOO_TEST_PATH_ZOT:" "${FOO_TEST_PATH_ZOT}")
  PrintPath("FOO_TEST_PROG_FOO:" "${FOO_TEST_PROG_FOO}")
  message("")

  unset(FOO_ROOT)
  unset(ENV{FOO_ROOT})
  if(NOT CMAKE_HOST_WIN32)
    unset(Foo_ROOT)
    unset(ENV{Foo_ROOT})
  endif()
  unset(FOO_TEST_FILE_FOO)
  unset(FOO_TEST_FILE_ZOT)
  unset(FOO_TEST_PATH_FOO)
  unset(FOO_TEST_PATH_ZOT)
  unset(FOO_TEST_PROG_FOO)
  unset(FOO_TEST_FILE_FOO CACHE)
  unset(FOO_TEST_FILE_ZOT CACHE)
  unset(FOO_TEST_PATH_FOO CACHE)
  unset(FOO_TEST_PATH_ZOT CACHE)
  unset(FOO_TEST_PROG_FOO CACHE)
endmacro()

RunTestCase()

set(FOO_ROOT      ${PackageRoot_BASE}/foo/cmake_root)
set(ENV{FOO_ROOT} ${PackageRoot_BASE}/foo/env_root)
if(RunCMake_TEST MATCHES "CaseSensitive")
  if(RunCMake_TEST STREQUAL "CMP0144-WARN-CaseSensitive-Mixed")
    set(Foo_ROOT      "${FOO_ROOT}")
    set(ENV{Foo_ROOT} "$ENV{FOO_ROOT}")
  else()
    set(Foo_ROOT      ${PackageRoot_BASE}/does_not_exist)
    set(ENV{Foo_ROOT} ${PackageRoot_BASE}/does_not_exist)
  endif()
endif()
RunTestCase()

set(FOO_ROOT      ${PackageRoot_BASE}/foo/cmake_root)
if(RunCMake_TEST MATCHES "CaseSensitive")
  if(RunCMake_TEST STREQUAL "CMP0144-WARN-CaseSensitive-Mixed")
    set(Foo_ROOT      "${FOO_ROOT}")
  else()
    set(Foo_ROOT      ${PackageRoot_BASE}/does_not_exist)
  endif()
endif()
RunTestCase()

set(ENV{FOO_ROOT} ${PackageRoot_BASE}/foo/env_root)
if(RunCMake_TEST MATCHES "CaseSensitive")
  if(RunCMake_TEST STREQUAL "CMP0144-WARN-CaseSensitive-Mixed")
    set(ENV{Foo_ROOT} "$ENV{FOO_ROOT}")
  else()
    set(ENV{Foo_ROOT} ${PackageRoot_BASE}/does_not_exist)
  endif()
endif()
RunTestCase()

message("----------")
