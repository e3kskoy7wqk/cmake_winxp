file(GENERATE
  OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/output-INPUT.txt"
  INPUT "${CMAKE_CURRENT_SOURCE_DIR}/InputAndContent-input.txt"
  CONTENT "CONTENT argument"
)
file(GENERATE
  OUTPUT "${CMAKE_CURRENT_BINARY_DIR}/output-CONTENT.txt"
  CONTENT "CONTENT argument"
  INPUT "${CMAKE_CURRENT_SOURCE_DIR}/InputAndContent-input.txt"
)
