enable_language(CXX)
set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE "$<IF:$<BOOL:FALSE>,${PSEUDO_IWYU},>")
set(CMAKE_CXX_CLANG_TIDY "$<IF:$<BOOL:FALSE>,${PSEUDO_TIDY} --error,>")
set(CMAKE_CXX_CPPLINT "$<IF:$<BOOL:FALSE>,${PSEUDO_CPPLINT} --error,>")
set(CMAKE_CXX_CPPCHECK "$<IF:$<BOOL:FALSE>,${PSEUDO_CPPCHECK} -bad,>")
add_executable(main main.cxx)
