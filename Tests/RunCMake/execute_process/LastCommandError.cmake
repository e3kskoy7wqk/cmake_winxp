execute_process(COMMAND ${CMAKE_COMMAND} -E true
  COMMAND ${CMAKE_COMMAND} -E false
  COMMAND ${CMAKE_COMMAND} -E false
  COMMAND ${CMAKE_COMMAND} -E false
  COMMAND ${CMAKE_COMMAND} -E true
  COMMAND ${CMAKE_COMMAND} -E false
  RESULT_VARIABLE result
)

if(NOT result EQUAL "0")
  execute_process(COMMAND ${CMAKE_COMMAND} -E true
    COMMAND ${CMAKE_COMMAND} -E false
    COMMAND ${CMAKE_COMMAND} -E false
    COMMAND ${CMAKE_COMMAND} -E false
    COMMAND ${CMAKE_COMMAND} -E true
    COMMAND ${CMAKE_COMMAND} -E false
    COMMAND_ERROR_IS_FATAL LAST
    )
endif()
