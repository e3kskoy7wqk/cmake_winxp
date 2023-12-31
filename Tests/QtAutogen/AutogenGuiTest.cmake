
# Tell find_package(Qt5) where to find Qt.
if(QT_QMAKE_EXECUTABLE)
  get_filename_component(Qt_BIN_DIR "${QT_QMAKE_EXECUTABLE}" PATH)
  get_filename_component(Qt_PREFIX_DIR "${Qt_BIN_DIR}" PATH)
  list(APPEND CMAKE_PREFIX_PATH ${Qt_PREFIX_DIR})
endif()

if (QT_TEST_VERSION EQUAL 4)

  find_package(Qt4 REQUIRED)
  include(UseQt4)

  set(QT_QTCORE_TARGET Qt4::QtCore)

  # Qt macros
  macro(qtx_wrap_cpp)
    qt4_wrap_cpp(${ARGN})
  endmacro()
  macro(qtx_generate_moc)
    qt4_generate_moc(${ARGN})
  endmacro()

elseif(QT_TEST_VERSION GREATER_EQUAL 5)

  find_package(Qt${QT_TEST_VERSION}Widgets REQUIRED)

  set(QT_QTCORE_TARGET Qt${QT_TEST_VERSION}::Core)
  set(QT_LIBRARIES Qt${QT_TEST_VERSION}::Widgets)

  # Include directories
  include_directories(${Qt${QT_TEST_VERSION}Widgets_INCLUDE_DIRS})

  # Definitions
  if(Qt${QT_TEST_VERSION}_POSITION_INDEPENDENT_CODE AND CMAKE_CXX_COMPILE_OPTIONS_PIC)
    add_definitions(${CMAKE_CXX_COMPILE_OPTIONS_PIC})
  endif()

  # Qt macros
  macro(qtx_wrap_cpp)
    cmake_language(CALL qt${QT_TEST_VERSION}_wrap_cpp ${ARGN})
  endmacro()
  macro(qtx_generate_moc)
    cmake_language(CALL qt${QT_TEST_VERSION}_generate_moc ${ARGN})
  endmacro()

else()
  message(SEND_ERROR "Invalid Qt version specified: ${QT_TEST_VERSION}")
endif()

# Get Qt compile features
get_property(QT_COMPILE_FEATURES
  TARGET ${QT_QTCORE_TARGET}
  PROPERTY INTERFACE_COMPILE_FEATURES
)
