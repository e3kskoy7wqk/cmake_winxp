enable_language(C)
set(CMAKE_BUILD_WITH_INSTALL_RPATH 1)
set(CMAKE_BUILD_WITH_INSTALL_NAME_DIR 1)
add_subdirectory(EXPORT-OldIFace)
add_library(foo SHARED empty.c)
target_link_libraries(foo bar)
install(TARGETS foo DESTINATION lib EXPORT fooExport)
install(EXPORT fooExport DESTINATION lib/cmake/foo EXPORT_LINK_INTERFACE_LIBRARIES)
