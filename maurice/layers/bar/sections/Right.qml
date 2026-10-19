import "../../../data" as D
//import Quickshell.Widgets
import "../widgets" as W
import "../widgets/audio" as Au
import QtQuick
import QtQuick.Layouts
import Quickshell

//widgets for the right section
RowLayout {
    //implicitHeight: parent.implicitHeight

    //height: 100
    //width: 200
    spacing: D.General.spacing
    //components created go from right to left
    layoutDirection: Qt.RightToLeft

    anchors {
        //these broke stuff?
        //top: parent.top
        //bottom: parent.bottom
        //verticalCenter: parent.verticalCenter

        //so it goes to the right.com
        right: parent.right
        //should look floaty
        margins: 1
        top: parent.top
        bottom: parent.bottom
    }

    W.Session {
        status: "SUSP"
    }

    W.Bat {
    }

    Au.Volume {
    }

    W.Brightness {
    }

}
