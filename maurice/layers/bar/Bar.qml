import "../../data" as D
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

    visible: D.General.barVisible
    color: "transparent"
    exclusionMode: ExclusionMode.Auto
    implicitHeight: D.General.barHeight

    anchors {
        //bottom: true
        left: true
        right: true
        top: true
    }
    //pretty sure this is the default, but this should let the bar shove windows out of the way. Ignore to.. not do that

    S.Left {
    }

    S.Middle {
        id: middle
    }

    S.Right {
    }

    Rectangle {
        visible: D.General.outline
        width: parent.width
        height: 1
        color: D.Colors.surface

        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
        }

    }

}
