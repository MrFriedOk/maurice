import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

Scope {
    id: root
    function size(md, ref) {
        if (md.text.length > 1)
            return (ref / 3);
        else
            return 96;
    }
    property list<var> items: [
        {
            text: "",
            action: () => {
                ipc.toggle();
            }
        },
        {
            text: "gay"
        },
        {
            text: "uwu"
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
                id: col
                spacing: 5
                anchors {
                    fill: parent
                    margins: 5
                }
                Repeater {
                    model: root.items

                    delegate: Rectangle {
                        id: delegateRt

                        color: area.containsMouse ? D.Colors.surface : D.Colors.widget
                        Behavior on color {
                            ColorAnimation {
                                duration: D.General.animDur
                            }
                        }
                        Text {
                            rotation: area.containsMouse ? -5 : 0
                            Behavior on rotation {
                                NumberAnimation {
                                    duration: 40
                                }
                            }
                            anchors {
                                fill: parent
                                centerIn: parent
                            }
                            color: D.Colors.fg

                            text: delegateRt.modelData.text
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font {
                                pointSize: root.size(delegateRt.modelData, delegateRt.width)
                            }
                        }
                        MouseArea {
                            id: area
                            anchors {
                                fill: parent
                            }
                            hoverEnabled: true
                        }
                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            left: parent.left
                            right: parent.right
                            top: delegateRt.index[0] ? parent.top : false
                        }
                        required property int index
                        required property var modelData
                        width: (menu.width / root.items.length) - (root.items.length * col.spacing)
                        height: width
                    }
                }
            }
        }
    }
}
