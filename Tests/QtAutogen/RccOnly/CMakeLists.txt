cmake_minimum_required(VERSION 3.16)
project(RccOnly)
include("../AutogenCoreTest.cmake")

# Test AUTORCC being enabled only
add_executable(rccOnly rccOnly.cpp rccOnlyRes.qrc)
set_property(TARGET rccOnly PROPERTY AUTORCC ON)
target_link_libraries(rccOnly ${QT_QTCORE_TARGET})
