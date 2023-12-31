enable_language(C)

set(CMAKE_GET_RUNTIME_DEPENDENCIES_PLATFORM "custom-platform")
set(CMAKE_GET_RUNTIME_DEPENDENCIES_TOOL "custom-platform-objdump")
set(CMAKE_GET_RUNTIME_DEPENDENCIES_COMMAND "path/to/custom-objdump")
set(CMAKE_OBJDUMP "custom-objdump")

install(CODE [[
message(FATAL_ERROR "
  CMAKE_GET_RUNTIME_DEPENDENCIES_PLATFORM: ${CMAKE_GET_RUNTIME_DEPENDENCIES_PLATFORM}
  CMAKE_GET_RUNTIME_DEPENDENCIES_TOOL: ${CMAKE_GET_RUNTIME_DEPENDENCIES_TOOL}
  CMAKE_GET_RUNTIME_DEPENDENCIES_COMMAND: ${CMAKE_GET_RUNTIME_DEPENDENCIES_COMMAND}
  CMAKE_OBJDUMP: ${CMAKE_OBJDUMP}
")
]]
COMPONENT dev
)
