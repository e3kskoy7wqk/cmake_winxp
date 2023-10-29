enable_language(C)
set(CMAKE_C_INCLUDE_WHAT_YOU_USE "${PSEUDO_IWYU}" -some -args)
set(CMAKE_C_CLANG_TIDY "${PSEUDO_TIDY}" -bad)
set(CMAKE_C_CPPLINT "${PSEUDO_CPPLINT}" --error)
set(CMAKE_C_CPPCHECK "${PSEUDO_CPPCHECK}" -error)
add_executable(main main.c)
set_source_files_properties(main.c PROPERTIES SKIP_LINTING ON)
