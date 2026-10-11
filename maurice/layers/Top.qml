//pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "bar" as Bars
//import "./bar/widgets" as Wi

Scope {
    //apply to every screen
    Variants {
        //id: top
        
        model: Quickshell.screens

        WlrLayershell.layer: WlrLayer.Background
        Bars.Bar{}
    }
}
