
cmake_policy(VERSION 3.11)

enable_language(C)

add_library (example SHARED empty.c)
set_property (TARGET example PROPERTY CUSTOM_PROPERTY1 "PROPERTY1")
set_property (TARGET example PROPERTY CUSTOM_PROPERTY2 "BEFORE_$<TARGET_PROPERTY:CUSTOM_PROPERTY1>_AFTER")

file(GENERATE OUTPUT "TARGET_GENEX_EVAL-generated.txt" CONTENT "$<TARGET_GENEX_EVAL:example,$<TARGET_PROPERTY:example,CUSTOM_PROPERTY2>>")
