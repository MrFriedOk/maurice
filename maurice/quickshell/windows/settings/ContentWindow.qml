import Quickshell
import QtQuick
import "."
import "../../data" as D

Flickable {
    property var activeWin: ''
    anchors {
        fill: parent
    }
    contentHeight: 2000
    clip: true
    Rectangle {
        radius: D.General.radius
        anchors {
            left: parent.left
            right: parent.right
        }
        height: 200
        Switch {
            assigned: D.General.iHateMyCPU
        }
    }
}
