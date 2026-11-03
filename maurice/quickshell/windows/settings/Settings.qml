import "../../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import "."

Scope {
    // property alias ipc: ipc
    // property alias visible: root.visible
    //property var func: ipc.toggle()

    //loading: D.General.settings

    FloatingWindow {
        //signal closeRequest()
        //property bool open: D.General.settings

        id: root
        //IpcHandler {
        //    id: ipc
        //    target: "settings"

        //    function toggle(): void {
        //        //settings.active = !settings.active;
        //        root.visible = !root.visible;
        //    }
        //}

        title: "settings"
        //WlrLayershell.Layer: WlrLayer.Top
        visible: D.General.settings//false
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
                id: row
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

                    TabsList {}

                    anchors {
                        //left: parent.bottom

                        //margins: 5
                        top: parent.top
                        bottom: parent.bottom
                    }
                }

                Rectangle {
                    //content container
                    width: (win.width - tabs.width) - 20
                    radius: win.radius
                    color: D.Colors.surface

                    ContentWindow {
                        activeWin: 'hi'
                    }

                    //field
                    anchors {
                        //left: parent.right

                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                        rightMargin: 1
                        //leftMargin: tabs.width + 5
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
                    onClicked: D.General.toggle()
                }
            }
        }
    }
}
