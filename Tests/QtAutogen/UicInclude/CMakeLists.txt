cmake_minimum_required(VERSION 3.16)
project(UicInclude)
include("../AutogenGuiTest.cmake")

# Test uic include patterns
set(CMAKE_AUTOUIC_SEARCH_PATHS "dirA")

add_executable(uicInclude main.cpp)
target_link_libraries(uicInclude ${QT_LIBRARIES})
set_target_properties(uicInclude PROPERTIES AUTOUIC ON)
set_property(TARGET uicInclude APPEND PROPERTY AUTOUIC_SEARCH_PATHS "dirB")
