install(FILES CMakeLists.txt DESTINATION foo COMPONENT test)

set(CPACK_THREADS 2)

if(PACKAGING_TYPE STREQUAL "COMPONENT")
  set(CPACK_COMPONENTS_ALL test)
endif()
