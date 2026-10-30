import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
    id: root
    property bool out: false
    PanelWindow {
        WlrLayershell.namespace: "launcher"
        MouseArea {
            id: hold
            anchors {
                fill: parent
            }
            hoverEnabled: true
            onHoveredChanged: root.out = false
        }
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        width: 150
        visible: root.out || hold.containsMouse

        anchors {
            right: true
            top: true
            bottom: true
        }

        Rectangle {
            //visible: prompt.hovered
            color: D.Colors.widget

            anchors {
                fill: parent
                topMargin: D.General.barHeight + 2
                bottomMargin: 2
            }
        }
    }
    PanelWindow {
        exclusionMode: ExlcusionMode.Ignore
        width: 1
        visible: !root.out
        color: "transparent"
        anchors {
            right: true
            bottom: true
            top: true
        }
        MouseArea {
            id: prompt

            hoverEnabled: true
            onHoveredChanged: root.out = true

            anchors {
                fill: parent
            }
        }
    }
}
