import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W
import "../../../data" as D


//widgets
RowLayout{
    anchors{
        //so it goes to the right.com
        right: parent.right
        //these broke stuff?
        //top: parent.top
        //bottom: parent.bottom

        //should look floaty
        margins: 2
        rightMargin: 70
        
        verticalCenter: parent.verticalCenter
    }
    spacing: 50

    //components created go from right to left
    layoutDirection: Qt.RightToLeft

    W.Bat{}
}