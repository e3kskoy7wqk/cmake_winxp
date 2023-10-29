set(expected ${artifact_path}/rtbin/${exe_name})
if(NOT EXISTS "${expected}")
  message(SEND_ERROR "executable artifact not created in the expected path:\n  ${expected}")
endif()

set(expected ${artifact_path}/staticlib/${static_name})
if(NOT EXISTS "${expected}")
  message(SEND_ERROR "static artifact not created in the expected path:\n  ${expected}")
endif()

if(expect_dll)
  set(expected ${artifact_path}/rtlib/${shared_name})
  if(NOT EXISTS "${expected}")
    message(SEND_ERROR "dll artifact not created in the expected path:\n  ${expected}")
  endif()
else()
  set(expected ${artifact_path}/sharedlib/${shared_name})
  if(NOT EXISTS "${expected}")
    message(SEND_ERROR "shared artifact not created in the expected path:\n  ${expected}")
  endif()
endif()
