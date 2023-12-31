if(CHECK_ERROR_OUTPUT_LOCATION)
  execute_process(COMMAND ${CMAKE_COMMAND} -E echo
    "--   1 COMMAND_ECHO " COMMAND_ECHO  )
endif()
# test COMMAND_ECHO STDOUT
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   1 COMMAND_ECHO STDOUT" COMMAND_ECHO STDOUT )
# test COMMAND_ECHO STDERR
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   2 COMMAND_ECHO STDERR" COMMAND_ECHO STDERR )
# test CMAKE_EXECUTE_PROCESS_COMMAND_ECHO STDOUT
set(CMAKE_EXECUTE_PROCESS_COMMAND_ECHO STDOUT)
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   3 COMMAND_ECHO STDOUT" )
# test CMAKE_EXECUTE_PROCESS_COMMAND_ECHO STDERR
set(CMAKE_EXECUTE_PROCESS_COMMAND_ECHO STDERR)
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   4 COMMAND_ECHO STDERR" )
# make sure local will override global settings
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   5 COMMAND_ECHO STDOUT" COMMAND_ECHO STDOUT )
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   6 COMMAND_ECHO NONE" COMMAND_ECHO NONE)
# test both and make sure override works
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   7 COMMAND_ECHO STDERR COMMAND_ECHO STDOUT" COMMAND_ECHO STDERR
  COMMAND_ECHO STDOUT)
execute_process(COMMAND ${CMAKE_COMMAND} -E echo
  "--   8 COMMAND_ECHO STDOUT COMMAND_ECHO STDERR" COMMAND_ECHO STDOUT
  COMMAND_ECHO STDERR)

# check for bad arguments to global and local
if(CHECK_GLOBAL)
  # make sure a non STDERR or STDOUT value is an error
  set(CMAKE_EXECUTE_PROCESS_COMMAND_ECHO BAD)
  execute_process(COMMAND ${CMAKE_COMMAND} -E echo
    "--   9 - 1 CMAKE_EXECUTE_PROCESS_COMMAND_ECHO BAD" )
else()
  execute_process(COMMAND ${CMAKE_COMMAND} -E echo
    "--   9 - 2 COMMAND_ECHO BAD" COMMAND_ECHO BAD)
endif()
