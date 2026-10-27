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

    //WlrLayershell.Layer: WlrLayer.Top
    visible: D.General.settings
    //implicitHeight: 100
    height: 500
    width: 700
    color: "transparent" //D.Colors.bg

    Rectangle {
        id: win

        radius: D.General.radius
        color: D.Colors.bg

        anchors {
            fill: parent
        }

        Row {
            spacing: 10

            anchors {
                margins: 5
                fill: parent
            }

            Rectangle {
                //tabs
                id: tabs

                width: 150
                color: D.Colors.surface
                radius: win.radius

                anchors {
                    //left: parent.bottom

                    //margins: 5
                    top: parent.top
                    bottom: parent.bottom
                }

            }

            Rectangle {
                width: (win.width - tabs.width)
                radius: win.radius
                color: D.Colors.surface

                //field
                anchors {
                    //left: parent.right

                    top: parent.top
                    bottom: parent.bottom
                    rightMargin: 5
                    topMargin: 20 + btn.anchors.margins
                }

            }

        }

        Rectangle {
            id: btn

            radius: win.radius
            //button close
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

}
