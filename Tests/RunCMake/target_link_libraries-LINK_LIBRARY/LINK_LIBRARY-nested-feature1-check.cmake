
if (NOT actual_stdout MATCHES "(/|-)-LIBFLAG.*${LINK_SHARED_LIBRARY_PREFIX}base1${LINK_SHARED_LIBRARY_SUFFIX}\"? +\"?(/|-)-LIBFLAG.*${LINK_SHARED_LIBRARY_PREFIX}base2${LINK_SHARED_LIBRARY_SUFFIX}")
  set (RunCMake_TEST_FAILED "Not found expected '--LIBFLAG<base1> --LIBFLAG<base2>'.")
endif()
