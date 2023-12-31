enable_language(C)

set(CMAKE_C_COMPILE_OPTIONS_COLOR_DIAGNOSTICS     -DCOLOR_ON)
set(CMAKE_C_COMPILE_OPTIONS_COLOR_DIAGNOSTICS_OFF -DCOLOR_OFF)

add_library(diag STATIC diag.c)
if(DEFINED EXPECT_COLOR)
  target_compile_definitions(diag PRIVATE EXPECT_COLOR=${EXPECT_COLOR})
endif()
