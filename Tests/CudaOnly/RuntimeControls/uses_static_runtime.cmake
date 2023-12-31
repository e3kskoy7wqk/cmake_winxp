execute_process(COMMAND ${DUMP_COMMAND} ${DUMP_ARGS} ${TEST_LIBRARY_PATH}
  RESULT_VARIABLE RESULT
  OUTPUT_VARIABLE OUTPUT
  ERROR_VARIABLE ERROR
)

if(NOT "${RESULT}" STREQUAL "0")
  message(FATAL_ERROR "${DUMP_COMMAND} failed [${RESULT}] [${OUTPUT}] [${ERROR}]")
endif()

if("${OUTPUT}" MATCHES "__cuda")
  message(FATAL_ERROR
    "missing cuda device symbols, static runtime linking was not used.")
endif()
