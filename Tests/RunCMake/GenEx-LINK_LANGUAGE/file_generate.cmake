enable_language(CXX C)

file(GENERATE
  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/output.txt
  CONTENT "LANG_IS_$<LINK_LANGUAGE>\n"
)
