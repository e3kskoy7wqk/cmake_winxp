cmake_minimum_required(VERSION 3.16)
project(MocOptions)
include("../AutogenCoreTest.cmake")

# Test extra options passed to moc via AUTOMOC_MOC_OPTIONS
add_executable(mocOptions Object.cpp main.cpp)
set_property(TARGET mocOptions PROPERTY AUTOMOC ON)
set_property(TARGET mocOptions PROPERTY AUTOMOC_MOC_OPTIONS "-nw")
target_link_libraries(mocOptions ${QT_LIBRARIES})
