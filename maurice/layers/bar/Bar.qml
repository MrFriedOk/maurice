import "../../data" as D
import "../../data/" as D
import "./sections" as S
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

//the actual bar component
PanelWindow {
    //reference the screen from Top.qml
    //implicitWidth: 30
    //left, middle and right

    id: bar

    color: "transparent"
    exclusionMode: ExclusionMode.Auto
    implicitHeight: 25

    anchors {
        //bottom: true
        left: true
        right: true
        top: true
    }
    //pretty sure this is the default, but this should let the bar shove windows out of the way. Ignore to.. not do that

    Item {
        anchors {
            topMargin: 0 //3
            fill: parent
        }

        S.Left {
        }

        S.Middle {
        }

        S.Right {
        }
        // Rectangle{

    }

}
