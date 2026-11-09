import QtQuick
import Quickshell
import "../../../data" as D

Rectangle {
    anchors {
        left: parent.left
    }
    radius: D.General.radius
    color: D.Colors.bg
    property bool text: true
    width: 200
    height: 50
}
