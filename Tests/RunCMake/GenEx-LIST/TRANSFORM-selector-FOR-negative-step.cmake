
file(GENERATE OUTPUT result.txt CONTENT "$<LIST:TRANSFORM,a;b;c,TOUPPER,FOR,0,2,-1>")
