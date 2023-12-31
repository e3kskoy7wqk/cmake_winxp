
enable_language(C)

set(cfg_dir)
get_property(_isMultiConfig GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(_isMultiConfig)
  set(cfg_dir /Debug)
endif()
set(DUMP_EXE "${CMAKE_CURRENT_BINARY_DIR}${cfg_dir}/dump${CMAKE_EXECUTABLE_SUFFIX}")

add_executable(dump dump.c)

# ensure no temp file will be used
string(REPLACE "${CMAKE_START_TEMP_FILE}" "" CMAKE_C_CREATE_SHARED_LIBRARY "${CMAKE_C_CREATE_SHARED_LIBRARY}")
string(REPLACE "${CMAKE_END_TEMP_FILE}" "" CMAKE_C_CREATE_SHARED_LIBRARY "${CMAKE_C_CREATE_SHARED_LIBRARY}")


# Use LINKER alone
add_library(linker SHARED LinkOptionsLib.c)
target_link_options(linker PRIVATE "LINKER:-foo,bar")

# use LAUNCH facility to dump linker command
set_property(TARGET linker PROPERTY RULE_LAUNCH_LINK "\"${DUMP_EXE}\"")

add_dependencies (linker dump)


# Use LINKER with SHELL
add_library(linker_shell SHARED LinkOptionsLib.c)
target_link_options(linker_shell PRIVATE "LINKER:SHELL:-foo bar")

# use LAUNCH facility to dump linker command
set_property(TARGET linker_shell PROPERTY RULE_LAUNCH_LINK "\"${DUMP_EXE}\"")

add_dependencies (linker_shell dump)


# generate reference for LINKER flag
if (CMAKE_C_LINKER_WRAPPER_FLAG)
  set(linker_flag ${CMAKE_C_LINKER_WRAPPER_FLAG})
  list(GET linker_flag -1 linker_space)
  if (linker_space STREQUAL " ")
    list(REMOVE_AT linker_flag -1)
  else()
    set(linker_space)
  endif()
  list (JOIN linker_flag " " linker_flag)
  if (CMAKE_C_LINKER_WRAPPER_FLAG_SEP)
    string (APPEND  linker_flag "${linker_space}" "-foo${CMAKE_C_LINKER_WRAPPER_FLAG_SEP}bar")
  else()
    set (linker_flag "${linker_flag}${linker_space}-foo ${linker_flag}${linker_space}bar")
  endif()
else()
  set(linker_flag "-foo bar")
endif()
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/LINKER.txt" "${linker_flag}")
