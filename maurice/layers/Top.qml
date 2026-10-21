//import "./bar/widgets" as Wi

import "../windows" as Windows
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland
import "bar" as Bars

//apply to every screen
Scope {
    Variants {
        model: Quickshell.screens

        Bars.Bar {
        }

    }

    Windows.Settings {
    }

}
