if(NOT EXISTS "${file}")
  message(FATAL_ERROR "Missing file:\n  ${file}")
endif()
execute_process(COMMAND "${objdump}" -p ${file} OUTPUT_VARIABLE out)
if(out MATCHES "NEEDED[^\n]*stdc\\+\\+")
  string(REPLACE "\n" "\n  " out "  ${out}")
  message(FATAL_ERROR "File:\n  ${file}\ndepends on libstdc++:\n${out}")
endif()
