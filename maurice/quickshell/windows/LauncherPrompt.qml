import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

Scope {
    id: root
    property list<string> items: [
        {
            text: "",
            action: () => {
                ipc.toggle();
            }
        },
    ]
    IpcHandler {
        id: ipc
        target: "menu"

        function toggle(): void {
            menu.out = !menu.out;
        }
    }
    PanelWindow {
        id: menu
        property bool out: false
        MouseArea {
            id: hold
            anchors {
                fill: parent
            }
            hoverEnabled: true
            // onHoveredChanged: root.out = false
        }
        exclusionMode: ExclusionMode.Ignore
        color: "transparent"
        width: 150
        visible: out || hold.containsMouse

        anchors {
            right: true
            top: true
            bottom: true
        }

        Rectangle {
            //visible: prompt.hovered
            color: D.Colors.widget

            anchors {
                fill: parent
                topMargin: D.General.barHeight + 2
                bottomMargin: 2
            }
            Column {
                anchors {
                    fill: parent
                }
                Repeater {
                    model: root.items
                }
            }
        }
    }
}
