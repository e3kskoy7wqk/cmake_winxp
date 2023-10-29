if(WIN32)
  set(_check_files
    [[lib]]
    [[lib/(lib)?namelink-none\.dll]]
    [[lib/(lib)?namelink-same\.dll]]
    [[lib/(lib)?namelink-sep\.dll]]
    [[lib/(lib)?namelink-skip\.dll]]
    [[lib/(lib)?namelink-uns-dev\.dll]]
    [[lib/(lib)?namelink-uns\.dll]]
  )
elseif(MSYS)
  set(_check_files
    [[lib]]
    [[lib/msys-namelink-none\.dll]]
    [[lib/msys-namelink-same-1\.dll]]
    [[lib/msys-namelink-sep-1\.dll]]
    [[lib/msys-namelink-skip-1\.dll]]
    [[lib/msys-namelink-uns-1\.dll]]
    [[lib/msys-namelink-uns-dev-1\.dll]]
  )
elseif(CYGWIN)
  set(_check_files
    [[lib]]
    [[lib/cygnamelink-none\.dll]]
    [[lib/cygnamelink-same-1\.dll]]
    [[lib/cygnamelink-sep-1\.dll]]
    [[lib/cygnamelink-skip-1\.dll]]
    [[lib/cygnamelink-uns-1\.dll]]
    [[lib/cygnamelink-uns-dev-1\.dll]]
  )
elseif(APPLE)
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.dylib]]
    [[lib/libnamelink-only\.dylib]]
    [[lib/libnamelink-same\.1\.0\.dylib]]
    [[lib/libnamelink-same\.1\.dylib]]
    [[lib/libnamelink-same\.dylib]]
    [[lib/libnamelink-sep\.1\.0\.dylib]]
    [[lib/libnamelink-sep\.1\.dylib]]
    [[lib/libnamelink-sep\.dylib]]
    [[lib/libnamelink-skip\.1\.0\.dylib]]
    [[lib/libnamelink-skip\.1\.dylib]]
    [[lib/libnamelink-uns-dev\.1\.0\.dylib]]
    [[lib/libnamelink-uns-dev\.1\.dylib]]
    [[lib/libnamelink-uns-dev\.dylib]]
    [[lib/libnamelink-uns\.1\.0\.dylib]]
    [[lib/libnamelink-uns\.1\.dylib]]
    [[lib/libnamelink-uns\.dylib]]
  )
elseif(NO_NAMELINK)
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.so]]
    [[lib/libnamelink-same\.so]]
    [[lib/libnamelink-sep\.so]]
    [[lib/libnamelink-skip\.so]]
    [[lib/libnamelink-uns-dev\.so]]
    [[lib/libnamelink-uns\.so]]
  )
else()
  set(_check_files
    [[lib]]
    [[lib/libnamelink-none\.so]]
    [[lib/libnamelink-only\.so]]
    [[lib/libnamelink-same\.so]]
    [[lib/libnamelink-same\.so\.1]]
    [[lib/libnamelink-same\.so\.1\.0]]
    [[lib/libnamelink-sep\.so]]
    [[lib/libnamelink-sep\.so\.1]]
    [[lib/libnamelink-sep\.so\.1\.0]]
    [[lib/libnamelink-skip\.so\.1]]
    [[lib/libnamelink-skip\.so\.1\.0]]
    [[lib/libnamelink-uns-dev\.so]]
    [[lib/libnamelink-uns-dev\.so\.1]]
    [[lib/libnamelink-uns-dev\.so\.1\.0]]
    [[lib/libnamelink-uns\.so]]
    [[lib/libnamelink-uns\.so\.1]]
    [[lib/libnamelink-uns\.so\.1\.0]]
  )
endif()

check_installed("^${_check_files}$")
