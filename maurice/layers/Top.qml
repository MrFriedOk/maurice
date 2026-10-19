//import "./bar/widgets" as Wi

import "../windows" as Windows
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "bar" as Bars

//apply to every screen
Variants {
    model: Quickshell.screens

    Windows.Settings {
    }

    Bars.Bar {
    }

}
