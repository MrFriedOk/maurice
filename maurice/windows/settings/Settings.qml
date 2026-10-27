import "../../data" as D
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
    //implicitHeight: 100
    height: 500
    width: 700
    color: D.Colors.bg

    Rectangle {
        color: area.containsMouse ? D.Colors.widget : D.Colors.surface
        width: 20
        height: 20

        anchors {
            margins: 5
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
