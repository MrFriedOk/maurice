import QtQuick
import QtQuick.Layouts
import Quickshell
//import Quickshell.Widgets
import "../widgets" as W

//widgets row
RowLayout{
    anchors{
        top: parent.top

        centerIn: parent

        margins: 2

    }

    W.Clock{}
}