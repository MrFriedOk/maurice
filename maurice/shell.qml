//	if (over):
//		Settings is visible
//else:
//	stop handling Settings
//	reset over bool
//	
//Settings.qml
//if (button.clicked)
//	visible = false

import "./layers" as E
import "./layers/bar/universal" as Mat
import "./layers/lock" as L
import "./windows" as Windows
import QtQuick
import QtQuick.Shapes
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "layers/notification" as Not //poop naming

ShellRoot {
    // call top layer (the bar and other stuff maybe)
    // E.Background{}

    id: root

    //property int wall: 0
    property bool over: hoverH
    property bool settings: false

    Mat.CoverArtMatugen {
    }

    // call background
    L.Lock {
    }

    Not.Notification {
    }

    E.Background {
    }

    PanelWindow {
        color: hoverH.hovered ? "green" : "red"
        implicitWidth: 3
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Top

        anchors {
            top: true
            bottom: true
            right: true
        }

        HoverHandler {
            id: hoverH
        }

    }

    Timer {
        id: clock

        interval: 1000
        onTriggered: settings = false
    }

    Windows.Settings {
        visible: settings
    }

    E.Top {
    }

}
