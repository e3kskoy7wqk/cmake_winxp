include(${RunCMake_TEST_SOURCE_DIR}/LinkBinariesBuildPhase_Funcs.cmake)
include(${RunCMake_TEST_BINARY_DIR}/foundLibs.cmake)

# obj2    --> Embeds func3.o in the link flags, but obj2 is part of the path
# ${libz} --> This is for imported2

foreach(mainTarget IN ITEMS app1 app2 shared1 shared3 module1 sharedFramework1)
  checkFlags(OTHER_LDFLAGS ${mainTarget}
    "obj2;${libz};${libresolv};CoreFoundation;sharedFrameworkExt;staticFrameworkExt"
    "static2;shared2;staticFramework2;sharedFramework2"
  )
endforeach()

foreach(mainTarget IN ITEMS app3 shared4)
  checkFlags(OTHER_LDFLAGS ${mainTarget}
    "obj2;${libz};${libresolv};CoreFoundation;sharedFrameworkExt;staticFrameworkExt;shared2;sharedFramework2"
    "static2;staticFramework2"
  )
endforeach()

foreach(mainTarget IN ITEMS static1 staticFramework1)
  checkFlags(OTHER_LIBTOOLFLAGS ${mainTarget}
    "obj2"
    "static2;shared2;staticFramework2;sharedFramework2;${libz};${libresolv};CoreFoundation;sharedFrameworkExt;staticFrameworkExt"
  )
endforeach()
