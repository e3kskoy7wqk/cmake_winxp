set("${CMAKE_FIND_PACKAGE_NAME}_MODULE" "${CMAKE_CURRENT_LIST_FILE}")
include(FindPackageHandleStandardArgs)
set(FPHSA_NAME_MISMATCHED 1)
find_package_handle_standard_args(NAMEMISMATCH REQUIRED_VARS "${CMAKE_FIND_PACKAGE_NAME}_MODULE")
unset(FPHSA_NAME_MISMATCHED)
set("${CMAKE_FIND_PACKAGE_NAME}_FOUND" 1)
