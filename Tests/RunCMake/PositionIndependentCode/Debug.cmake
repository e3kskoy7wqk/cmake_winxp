
add_library(iface INTERFACE)
set_property(TARGET iface PROPERTY INTERFACE_POSITION_INDEPENDENT_CODE ON)

set(CMAKE_DEBUG_TARGET_PROPERTIES POSITION_INDEPENDENT_CODE)
add_library(foo main.cpp)
target_link_libraries(foo iface)
set_property(TARGET foo PROPERTY POSITION_INDEPENDENT_CODE ON)
