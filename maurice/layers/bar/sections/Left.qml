import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W

//iterate across widgets
RowLayout{
    anchors{
    left: parent.left
    top: parent.top
    bottom: parent.bottom

    leftMargin: 100
    
    verticalCenter: parent.verticalCenter
    }

    layoutDirection: Qt.LeftToRight

    W.Bat{}
}