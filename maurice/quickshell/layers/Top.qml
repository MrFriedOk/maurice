//import "./bar/widgets" as Wi

import "../windows" as Win
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import Quickshell
import Quickshell.Wayland
import "bar" as Bars

//apply to every screen
Scope {
    //S.Settings {
    //}

    Variants {
        model: Quickshell.screens

        Bars.Bar {
        }

    }

    Win.WindowHandler {
    }

}
