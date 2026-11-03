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
    Row {
        //radius: D.General.radius
        anchors {
            left: parent.left
            right: parent.right
        }
        height: 200
        Switch {
            //sketch bar?
            assigned: D.General.sketchBar
            onToggled: assigned => D.General.sketchBar = assigned
        }
    }
}
