// Component: CMake.Dialogs.QtGUI

function Component()
{
    // Default constructor
}

Component.prototype.createOperations = function()
{
    // Create shortcut
    if (installer.value("os") === "win") {

        component.addOperation("CreateShortcut",
                               "@TargetDir@/bin/cmake-gui.exe",
                               "@StartMenuDir@/CMake (cmake-gui).lnk");

    }

    // Call default implementation
    component.createOperations();
}
