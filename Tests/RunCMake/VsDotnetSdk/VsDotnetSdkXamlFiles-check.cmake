set(vcProjectFile "${RunCMake_TEST_BINARY_DIR}/dotNetSdkWpfApp.csproj")
if(NOT EXISTS "${vcProjectFile}")
  set(RunCMake_TEST_FAILED "Project file ${vcProjectFile} does not exist.")
  return()
endif()

set(inAppDefinition FALSE)
set(inPageDefinition FALSE)
set(inResourceDefinition FALSE)
set(xamlAppDefinitionSet FALSE)
set(xamlPageSet FALSE)
set(resourcesSet FALSE)

file(STRINGS "${vcProjectFile}" lines)
foreach(line IN LISTS lines)
  if(NOT inAppDefinition AND line MATCHES "^ *<ApplicationDefinition[^>]*>")
    set(inAppDefinition TRUE)
  elseif(inAppDefinition AND line MATCHES "^ *<Link>([^<>]+)</Link>$")
    if("${CMAKE_MATCH_1}" STREQUAL "App.xaml")
        message(STATUS "dotNetSdkWpfApp.csproj has app definition set")
        set(xamlAppDefinitionSet TRUE)
        set(inAppDefinition FALSE)
    endif()
  elseif(NOT inPageDefinition AND line MATCHES "^ *<Page[^>]*>")
    set(inPageDefinition TRUE)
  elseif(inPageDefinition AND line MATCHES "^ *<Link>([^<>]+)</Link>$")
    if("${CMAKE_MATCH_1}" STREQUAL "MainWindow.xaml")
        message(STATUS "dotNetSdkWpfApp.csproj has main window page set")
        set(xamlPageSet TRUE)
        set(inPageDefinition FALSE)
    endif()
  elseif(NOT inResourceDefinition AND line MATCHES "^ *<EmbeddedResource[^>]*>")
    set(inResourceDefinition TRUE)
  elseif(inResourceDefinition AND line MATCHES "^ *<Link>([^<>]+)</Link>$")
    if("${CMAKE_MATCH_1}" STREQUAL "Resources.resx")
        message(STATUS "dotNetSdkWpfApp.csproj has embedded resources set")
        set(resourcesSet TRUE)
        set(inResourceDefinition FALSE)
    endif()
  endif()
endforeach()

if(NOT xamlAppDefinitionSet)
  set(RunCMake_TEST_FAILED "Xaml App definition not set correctly.")
  return()
endif()

if(NOT xamlPageSet)
  set(RunCMake_TEST_FAILED "Xaml Page not set correctly.")
  return()
endif()

if(NOT resourcesSet)
  set(RunCMake_TEST_FAILED "resources not set correctly.")
  return()
endif()
