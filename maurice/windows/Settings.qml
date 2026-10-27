import "../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    //signal closeRequest()
    //property bool open: D.General.settings

    id: root

    visible: D.General.settings
    implicitWidth: {
        if (open)
            return 1000;
        else
            return 10;
    }
    implicitHeight: 100
    color: "green"

    Rectangle {
        color: area.containsMouse ? "red" : "green"
        width: 25
        height: 25

        anchors {
            right: parent.right
            top: parent.top
        }

        MouseArea {
            //root.visible = false;
            //root.closeRequest;

            id: area

            anchors.fill: parent
            enabled: true
            hoverEnabled: true
            onClicked: {
                D.General.settings = false;
            }
        }

    }

}
