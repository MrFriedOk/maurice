import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland

PanelWindow {
    id: root

    property bool open: false

    signal closeRequest()

    visible: open
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

            id: area

            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                //open = !open;
                root.closeRequest;
            }
        }

    }

}
