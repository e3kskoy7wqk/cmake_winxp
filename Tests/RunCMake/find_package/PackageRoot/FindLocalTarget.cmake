add_library(imported_global_lib SHARED IMPORTED GLOBAL)
add_executable(imported_explicit_global_ex IMPORTED GLOBAL)

add_library(imported_local_lib SHARED IMPORTED)
add_executable(imported_implied_local_ex IMPORTED)
