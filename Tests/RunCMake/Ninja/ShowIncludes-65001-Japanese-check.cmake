# 'cl /showIncludes' prefix with 'VSLANG=1041' and 'chcp 65001'.
string(ASCII 227 131 161 227 131 162 58 32 227 130 164 227 131 179 227 130 175 227 131 171 227 131 188 227 131 137 32 227 131 149 227 130 161 227 130 164 227 131 171 58 32 32 expect)
include(${CMAKE_CURRENT_LIST_DIR}/ShowIncludes-check.cmake)
