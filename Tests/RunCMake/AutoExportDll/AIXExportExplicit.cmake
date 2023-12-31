enable_language(C)

set(CMAKE_AIX_EXPORT_ALL_SYMBOLS OFF)
add_library(AIXExportExplicitLib SHARED AIXExportExplicitLib.c)
add_executable(AIXExportExplicitMain AIXExportExplicitMain.c)
target_link_options(AIXExportExplicitLib PRIVATE LINKER:-bE:${CMAKE_CURRENT_SOURCE_DIR}/AIXExportExplicitLib.exp)
target_link_libraries(AIXExportExplicitMain PRIVATE AIXExportExplicitLib)
