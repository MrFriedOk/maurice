//	if (over):
//		Settings is visible
//else:
//	stop handling Settings
//	reset over bool
//
//Settings.qml
//if (button.clicked)
//	visible = false
//poop naming

import "./data" as D
import "./layers" as E
import "./layers/bar/universal" as Mat
import "./layers/lock" as L
//import "./windows/settings" as S
import "./windows" as Windows
import QtQuick
//import QtQuick.Shapes
import Quickshell
//import Quickshell.Io
//import Quickshell.Wayland
import "layers/notification" as Not
import "data" as D
import Quickshell.Hyprland
import Quickshell.Wayland

ShellRoot {
    // call top layer (the bar and other stuff maybe)
    // E.Background{}
    //property bool settings: D.General.setting
    //Windows.WindowHandler {
    //}
    //property int wall: 0
    //property bool over: hoverH

    Mat.CoverArtMatugen {}

    Windows.Menu {}

    // call background
    L.Lock {}

    Not.Notification {}

    E.Background {}

    E.Top {}
}
