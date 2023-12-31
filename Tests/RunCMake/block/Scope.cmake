
set(VAR1 "OUTER1")
set(VAR2 "OUTER2")
set(VAR3 "OUTER3")
set(VAR4 "OUTER4")
set(VAR5 "OUTER5")

set(VAR6 "CACHE6" CACHE STRING "")
set(VAR6 "OUTER6")

set(VARSUB1 "OUTERSUB1")
set(VARSUB2 "OUTERSUB2")

cmake_policy(SET CMP0139 NEW)

# create a block with a new scope for variables and policies
block(PROPAGATE VAR3 VAR4 VAR5 VAR6 VAR7 VARSUB2)
  set(VAR1 "INNER1")
  set(VAR2 "INNER2" PARENT_SCOPE)
  set(VAR3 "INNER3")
  unset(VAR4)
  unset(VAR6)
  set(VAR7 "INNER7")
  add_subdirectory(Scope)

  cmake_policy(SET CMP0139 OLD)
endblock()

# check final values for variables
if(NOT DEFINED VAR1 OR NOT VAR1 STREQUAL "OUTER1")
  message(SEND_ERROR "block/endblock: VAR1 has unexpected value: ${VAR1}")
endif()
if(NOT DEFINED VAR2 OR NOT VAR2 STREQUAL "INNER2")
  message(SEND_ERROR "block/endblock: VAR2 has unexpected value: ${VAR2}")
endif()
if(NOT DEFINED VAR3 OR NOT VAR3 STREQUAL "INNER3")
  message(SEND_ERROR "block/endblock: VAR3 has unexpected value: ${VAR3}")
endif()
if(DEFINED VAR4)
  message(SEND_ERROR "block/endblock: VAR4 is unexpectedly defined: ${VAR4}")
endif()
if(NOT DEFINED VAR5 OR NOT VAR5 STREQUAL "OUTER5")
  message(SEND_ERROR "block/endblock: VAR5 has unexpected value: ${VAR5}")
endif()
unset(VAR6 CACHE)
if (DEFINED VAR6)
  message(SEND_ERROR "block/endblock: VAR6 is unexpectedly defined: ${VAR6}")
endif()
if(NOT DEFINED VAR7 OR NOT VAR7 STREQUAL "INNER7")
  message(SEND_ERROR "block/endblock: VAR6 has unexpected value: ${VAR7}")
endif()
if(NOT DEFINED VARSUB1 OR NOT VARSUB1 STREQUAL "OUTERSUB1")
  message(SEND_ERROR "block/endblock: VARSUB1 has unexpected value: ${VARSUB1}")
endif()
if(NOT DEFINED VARSUB2 OR NOT VARSUB2 STREQUAL "SUBDIR2")
  message(SEND_ERROR "block/endblock: VARSUB2 has unexpected value: ${VARSUB2}")
endif()

cmake_policy(GET CMP0139 CMP0139_STATUS)
if(NOT CMP0139_STATUS STREQUAL "NEW")
    message(SEND_ERROR "block/endblock: CMP0139 has unexpected value: ${CMP0139_STATUS}")
endif()
