import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W
import "../../../data" as D


//iterate across widgets
RowLayout{
    anchors{
    right: parent.right
    top: parent.top
    bottom: parent.bottom

    rightMargin: 100
    
    verticalCenter: parent.verticalCenter
    }
    
    layoutDirection: Qt.RightToLeft

    W.Viz{}
}