set(MACOS_FW_LIB_VERSION "0.1")
set(MACOS_FW_LIB_SRCS
  macos_fw_lib.cpp
)
set(MACOS_FW_LIB_HDRS
  macos_fw_lib.h
)

include_directories(
  ${CMAKE_CURRENT_SOURCE_DIR}
  ${CMAKE_CURRENT_BINARY_DIR}
  ${Qt${QT_TEST_VERSION}Core_INCLUDE_DIRS}
)

add_library(macos_fw_lib SHARED
  ${MACOS_FW_LIB_SRCS}
  ${MACOS_FW_LIB_HDRS}
)
set_target_properties(macos_fw_lib PROPERTIES AUTOMOC TRUE)
set_target_properties(macos_fw_lib PROPERTIES
  CLEAN_DIRECT_OUTPUT 1
  FRAMEWORK 1
  FRAMEWORK_VERSION ${MACOS_FW_LIB_VERSION}
  VERSION ${MACOS_FW_LIB_VERSION}
  SOVERSION ${MACOS_FW_LIB_VERSION}
  MACOSX_FRAMEWORK_SHORT_VERSION_STRING ${MACOS_FW_LIB_VERSION}
  MACOSX_FRAMEWORK_IDENTIFIER org.macos.fw_lib
  POSITION_INDEPENDENT_CODE ON
  PUBLIC_HEADER "${MACOS_FW_LIB_HDRS}"
)
target_link_libraries(macos_fw_lib PRIVATE ${QT_QTCORE_TARGET})
