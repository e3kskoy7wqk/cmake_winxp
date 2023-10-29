list(JOIN undefList % out)
if(NOT out STREQUAL "")
  message(FATAL_ERROR "\"list(JOIN undefList % out)\" set out to \"${out}\"")
endif()
set(myList a)
list(JOIN myList % out)
if(NOT out STREQUAL "a")
  message(FATAL_ERROR "\"list(JOIN \"a\" % out)\" set out to \"${out}\"")
endif()
set(myList a b)
list(JOIN myList % out)
if(NOT out STREQUAL "a%b")
  message(FATAL_ERROR "\"list(JOIN \"a;b\" % out)\" set out to \"${out}\"")
endif()
list(JOIN myList "" out)
if(NOT out STREQUAL "ab")
  message(FATAL_ERROR "\"list(JOIN \"a;b\" \"\" out a)\" set out to \"${out}\"")
endif()
