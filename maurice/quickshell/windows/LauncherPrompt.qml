import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    exclusionMode: ExclusionMode.Ignore
    color: "transparent"
    width: prompt.hovered ? 200 : 5

    MouseArea {
        id: prompt

        property bool hovered: false

        hoverEnabled: true
        onHoveredChanged: hovered = !hovered

        anchors {
            fill: parent
        }

    }

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
