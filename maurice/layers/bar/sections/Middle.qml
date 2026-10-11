import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W

//iterate across widgets
RowLayout{
    anchors{
        top: parent.top

        topMargin: 20

        centerIn: parent
    }

    W.Viz{}
}