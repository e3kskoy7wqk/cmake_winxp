
enable_language(C)

add_library(empty SHARED empty.c)

get_property(_isMultiConfig GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(_isMultiConfig)
  list(GET CMAKE_CONFIGURATION_TYPES 0 FIRST_CONFIG)
  set(GENERATE_CONDITION CONDITION $<CONFIG:${FIRST_CONFIG}>)
endif()

file(GENERATE
  OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/test.txt"
  CONTENT "$<TARGET_PDB_FILE_BASE_NAME:empty>"
  ${GENERATE_CONDITION}
)
