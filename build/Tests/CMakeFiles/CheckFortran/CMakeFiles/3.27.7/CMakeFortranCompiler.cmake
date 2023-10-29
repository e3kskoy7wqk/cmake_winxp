set(CMAKE_Fortran_COMPILER "D:/mingw/bin/gfortran.exe")
set(CMAKE_Fortran_COMPILER_ARG1 "")
set(CMAKE_Fortran_COMPILER_ID "GNU")
set(CMAKE_Fortran_COMPILER_VERSION "9.5.0")
set(CMAKE_Fortran_COMPILER_WRAPPER "")
set(CMAKE_Fortran_PLATFORM_ID "MinGW")
set(CMAKE_Fortran_SIMULATE_ID "")
set(CMAKE_Fortran_COMPILER_FRONTEND_VARIANT "GNU")
set(CMAKE_Fortran_SIMULATE_VERSION "")




set(CMAKE_AR "D:/mingw/bin/ar.exe")
set(CMAKE_Fortran_COMPILER_AR "D:/mingw/bin/gcc-ar.exe")
set(CMAKE_RANLIB "D:/mingw/bin/ranlib.exe")
set(CMAKE_TAPI "CMAKE_TAPI-NOTFOUND")
set(CMAKE_Fortran_COMPILER_RANLIB "D:/mingw/bin/gcc-ranlib.exe")
set(CMAKE_COMPILER_IS_GNUG77 1)
set(CMAKE_Fortran_COMPILER_LOADED 1)
set(CMAKE_Fortran_COMPILER_WORKS TRUE)
set(CMAKE_Fortran_ABI_COMPILED TRUE)

set(CMAKE_Fortran_COMPILER_ENV_VAR "FC")

set(CMAKE_Fortran_COMPILER_SUPPORTS_F90 1)

set(CMAKE_Fortran_COMPILER_ID_RUN 1)
set(CMAKE_Fortran_SOURCE_FILE_EXTENSIONS f;F;fpp;FPP;f77;F77;f90;F90;for;For;FOR;f95;F95;f03;F03;f08;F08)
set(CMAKE_Fortran_IGNORE_EXTENSIONS h;H;o;O;obj;OBJ;def;DEF;rc;RC)
set(CMAKE_Fortran_LINKER_PREFERENCE 20)
set(CMAKE_Fortran_LINKER_DEPFILE_SUPPORTED TRUE)
if(UNIX)
  set(CMAKE_Fortran_OUTPUT_EXTENSION .o)
else()
  set(CMAKE_Fortran_OUTPUT_EXTENSION .obj)
endif()

# Save compiler ABI information.
set(CMAKE_Fortran_SIZEOF_DATA_PTR "4")
set(CMAKE_Fortran_COMPILER_ABI "")
set(CMAKE_Fortran_LIBRARY_ARCHITECTURE "")

if(CMAKE_Fortran_SIZEOF_DATA_PTR AND NOT CMAKE_SIZEOF_VOID_P)
  set(CMAKE_SIZEOF_VOID_P "${CMAKE_Fortran_SIZEOF_DATA_PTR}")
endif()

if(CMAKE_Fortran_COMPILER_ABI)
  set(CMAKE_INTERNAL_PLATFORM_ABI "${CMAKE_Fortran_COMPILER_ABI}")
endif()

if(CMAKE_Fortran_LIBRARY_ARCHITECTURE)
  set(CMAKE_LIBRARY_ARCHITECTURE "")
endif()





set(CMAKE_Fortran_IMPLICIT_INCLUDE_DIRECTORIES "D:/mingw/lib/gcc/i686-w64-mingw32/9.5.0/finclude;D:/mingw/lib/gcc/i686-w64-mingw32/9.5.0/include;D:/mingw/include;D:/mingw/lib/gcc/i686-w64-mingw32/9.5.0/include-fixed;D:/mingw/i686-w64-mingw32/include")
set(CMAKE_Fortran_IMPLICIT_LINK_LIBRARIES "gfortran;mingw32;gcc_s;gcc;moldname;mingwex;quadmath;m;mingw32;gcc_s;gcc;moldname;mingwex;pthread;advapi32;shell32;user32;kernel32;mingw32;gcc_s;gcc;moldname;mingwex")
set(CMAKE_Fortran_IMPLICIT_LINK_DIRECTORIES "D:/mingw/lib/gcc/i686-w64-mingw32/9.5.0;D:/mingw/lib/gcc;D:/mingw/i686-w64-mingw32/lib;D:/mingw/lib;/mingw/lib")
set(CMAKE_Fortran_IMPLICIT_LINK_FRAMEWORK_DIRECTORIES "")
