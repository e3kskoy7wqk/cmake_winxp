check_files("${RunCMake_TEST_BINARY_DIR}"
  INCLUDE
    ${GENERATED_FILES}

  EXCLUDE
    ${TARGET_OBJECT_FILES_simplecudaexe_Debug}
    ${TARGET_OBJECT_FILES_simplecudashared_Debug}
    ${TARGET_OBJECT_FILES_simplecudaobj_Debug}

    ${TARGET_OBJECT_FILES_simplecudaexe_Release}
    ${TARGET_OBJECT_FILES_simplecudashared_Release}
    ${TARGET_OBJECT_FILES_simplecudaobj_Release}

    ${TARGET_OBJECT_FILES_simplecudaexe_MinSizeRel}
    ${TARGET_OBJECT_FILES_simplecudashared_MinSizeRel}
    ${TARGET_OBJECT_FILES_simplecudaobj_MinSizeRel}

    ${TARGET_OBJECT_FILES_simplecudaexe_RelWithDebInfo}
    ${TARGET_OBJECT_FILES_simplecudashared_RelWithDebInfo}
    ${TARGET_OBJECT_FILES_simplecudaobj_RelWithDebInfo}
  )
