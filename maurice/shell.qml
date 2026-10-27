//	if (over):
//		Settings is visible
//else:
//	stop handling Settings
//	reset over bool
//	
//Settings.qml
//if (button.clicked)
//	visible = false

import "./data" as D
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
    //property bool settings: D.General.setting

    id: root

    //property int wall: 0
    property bool over: hoverH

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
        implicitWidth: 1
        exclusionMode: ExclusionMode.Ignore
        WlrLayershell.layer: WlrLayer.Top

        anchors {
            top: true
            bottom: true
            right: true
        }

        HoverHandler {
            //property bool hovered: false

            id: hoverH

            onHoveredChanged: {
                //hovered = !hovered;
                if (hovered)
                    return buffer.running = true;
                else
                    return buffer.running = false;
            }
        }

    }

    Timer {
        id: buffer

        interval: 500
        onTriggered: D.General.settings = true
    }

    Windows.Settings {
        visible: D.General.settings //root.settings
    }

    E.Top {
    }

}
