import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "bar" as Bars
//import "./bar/widgets" as Wi


//apply to every screen
Variants {
    
    model: Quickshell.screens

    WlrLayershell.layer: WlrLayer.Top
    Bars.Bar{}
}
