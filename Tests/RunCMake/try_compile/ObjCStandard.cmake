include(${CMAKE_CURRENT_SOURCE_DIR}/${try_compile_DEFS})

enable_language(OBJC)

try_compile(result ${try_compile_bindir_or_SOURCES}
  ${CMAKE_CURRENT_SOURCE_DIR}/src.m
  OBJC_STANDARD 3
  OUTPUT_VARIABLE out
  )

message("try_compile output:\n${out}")
