import Quickshell
import QtQuick
import "../../data" as D

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
