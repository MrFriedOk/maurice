import "../../../data" as D
//import Quickshell.Widgets
import "../widgets" as W
import QtQuick
import QtQuick.Layouts
import Quickshell

//widgets row
RowLayout {
    spacing: D.General.spacing

    anchors {
        //        margins: 2
        //top: parent.top
        horizontalCenter: parent.horizontalCenter
    }

    W.Clock {
    }

}
