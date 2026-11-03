import Quickshell
import QtQuick
import "../../data" as D

Rectangle {
    id: root
    property bool assigned: false

    radius: height / 2
    height: 30
    width: height * 3
    color: D.Colors.surface
    Rectangle {
        radius: parent.radius
        anchors {
            fill: parent
            margins: 1
        }
        color: root.assigned ? D.Colors.fg : D.Colors.widget
    }
}
