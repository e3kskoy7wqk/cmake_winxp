cmake_policy(VERSION 3.11)

set(mylist FILTER_THIS_BIT DO_NOT_FILTER_THIS thisisanitem FILTER_THIS_THING)
file(GENERATE OUTPUT "FILTER-generated.txt" CONTENT "$<FILTER:${mylist},EXCLUDE,^FILTER_THIS_.+>")
