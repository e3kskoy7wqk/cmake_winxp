enable_language(C)

configure_file(PreventConfigureFileDupBuildRule.cmake PreventTargetAliasesDupBuildRule.cmake @ONLY)
add_subdirectory(SubDirConfigureFileDup)
