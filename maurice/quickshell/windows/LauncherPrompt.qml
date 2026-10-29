import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland

Scope {
    PanelWindow {
        exclusionMode: ExlcusionMode.Ignore
        width: 1
        WlrLayershell.layer: WlrLayer.Top
        color: prompt.hovered ? "red" : "green"
        anchors {
            right: true
            bottom: true
            top: true
        }
        MouseArea {
            id: prompt

            property bool hovered: false
            enabled: true

            hoverEnabled: true
            onHoveredChanged: hovered = !hovered

            anchors {
                fill: parent
            }
        }
    }

    PanelWindow {
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        width: 150
        visible: prompt.hovered

        anchors {
            right: true
            top: true
            bottom: true
        }

        Rectangle {
            visible: prompt.hovered
            color: D.Colors.widget

            anchors {
                fill: parent
                topMargin: D.General.barHeight + 2
                bottomMargin: 2
            }
        }
    }
}
