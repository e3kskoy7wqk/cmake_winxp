set(PKG_CONFIG_EXECUTABLE "pkg-config-does-not-exist" CACHE FILEPATH "")
find_package(PkgConfig)
message(STATUS "PKG_CONFIG_FOUND='${PKG_CONFIG_FOUND}'")
message(STATUS "PKG_CONFIG_EXECUTABLE='${PKG_CONFIG_EXECUTABLE}'")
