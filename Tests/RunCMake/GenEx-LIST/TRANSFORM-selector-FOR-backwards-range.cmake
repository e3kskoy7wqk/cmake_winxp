
file(GENERATE OUTPUT result.txt CONTENT "$<LIST:TRANSFORM,a;b;c,TOUPPER,FOR,2,0>")
