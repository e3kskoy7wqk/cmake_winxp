message(STATUS "start")
foreach(outer RANGE 7 9)
  if("${outer}" EQUAL 8)
    continue()
  endif()
  foreach(inner RANGE 1 5)
    if("${inner}" EQUAL 1 OR "${inner}" EQUAL 3 OR "${inner}" EQUAL 5)
      continue()
    endif()
    message(STATUS "${outer} ${inner}")
  endforeach()
endforeach()
message(STATUS "end")
