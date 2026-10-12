import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W

//iterate across widgets
RowLayout{
    anchors{
        left: parent.left
        // top: parent.top
        // bottom: parent.bottom

        margins: 2
        leftMargin: 10
        
        verticalCenter: parent.verticalCenter
    }
    spacing: 50

    layoutDirection: Qt.LeftToRight

    W.Workspace{}
}