enable_language(C)
file(WRITE "${CMAKE_CURRENT_BINARY_DIR}/main.c" "int main() { return 0;}")

set(include_dir "${CMAKE_CURRENT_BINARY_DIR}/dir")
set(after_include_dir "${CMAKE_CURRENT_BINARY_DIR}/dirAfter")
file(MAKE_DIRECTORY "${include_dir}")
file(MAKE_DIRECTORY "${after_include_dir}")

add_executable(main "${CMAKE_CURRENT_BINARY_DIR}/main.c")
include_directories("${include_dir}")
target_include_directories(main AFTER PRIVATE "${after_include_dir}")

get_target_property(actual_include_dirs main INCLUDE_DIRECTORIES)
set(desired_include_dirs "${include_dir}" "${after_include_dir}")

if (NOT "${actual_include_dirs}" MATCHES "${desired_include_dirs}")
    message(SEND_ERROR "include after does not work")
endif()
