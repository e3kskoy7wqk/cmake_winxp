
if (NOT VALID_LANG)
  set (VALID_LANG C)
endif()
if (NOT INVALID_LANG)
  set (INVALID_LANG CXX)
endif()

if (NOT actual_stdout MATCHES "BADFLAG_${VALID_LANG}_LANG_ID")
  set (RunCMake_TEST_FAILED "Not found expected 'BADFLAG_${VALID_LANG}_LANG_ID'.\n")
endif()
if (actual_stdout MATCHES "BADFLAG_${INVALID_LANG}_LANG_ID")
  if (RunCMake_TEST_FAILED)
    string (APPEND RunCMake_TEST_FAILED "\n")
  endif()
  string (APPEND RunCMake_TEST_FAILED "Found unexpected 'BADFLAG_${INVALID_LANG}_LANG_ID '.")
endif()
if (actual_stdout MATCHES "BADFLAG_(${VALID_LANG}|${INVALID_LANG})_BADID")
  if (RunCMake_TEST_FAILED)
    string (APPEND RunCMake_TEST_FAILED "\n")
  endif()
  string (APPEND RunCMake_TEST_FAILED "Found unexpected 'BADFLAG_(${VALID_LANG}|${INVALID_LANG})_BADID'.")
endif()
