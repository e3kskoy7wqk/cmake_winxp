file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/test/first")
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/test/second")
file(MAKE_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/test/third")

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/test/first/one" "one")
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/test/second/two" "two")
file(GLOB_RECURSE CONTENT_LIST_1
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_BINARY_DIR}/test/*"
  )

file(GLOB_RECURSE CONTENT_LIST_2
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_BINARY_DIR}/test/*"
  )

file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/test/third/three" "three")
file(GLOB_RECURSE CONTENT_LIST_3
  CONFIGURE_DEPENDS
  "${CMAKE_CURRENT_BINARY_DIR}/test/*"
  )
