
include(CTest)
enable_testing()

add_test(NAME dummy COMMAND ${CMAKE_COMMAND} -E echo $<LINK_LANGUAGE>)
