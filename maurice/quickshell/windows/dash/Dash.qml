import Quickshell
import QtQuick
import "."
import "../../data" as D

LazyLoader {
    //active: D.General.dash
    loading: D.General.dash
    PanelWindow {
        id: root
        Timer {
            id: timer
            interval: 500
            running: D.General.dash
            //onTriggered: //root.visible = !root.visible
            //onTriggered: {
            //    if (!D.General.dash)
            //        root.visible = true;
            //    if (D.General.dash)
            //        root.visible = false;
            //}
        }
        //visible: D.General.dash
        height: D.General.dash ? 400 : 1
        Behavior on height {
            NumberAnimation {
                duration: 20 //D.General.animDur
            }
        }
        anchors {
            bottom: true
        }
        exclusionMode: ExclusionMode.Ignore
        width: 1000
        color: "transparent"
        Rectangle {
            anchors {
                fill: parent
            }
            color: D.Colors.bg
        }
    }
}
