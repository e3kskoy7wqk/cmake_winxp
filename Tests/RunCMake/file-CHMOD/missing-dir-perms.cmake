file(TOUCH ${CMAKE_CURRENT_BINARY_DIR}/a)
file(CHMOD ${CMAKE_CURRENT_BINARY_DIR}/a PERMISSIONS OWNER_READ DIRECTORY_PERMISSIONS)
