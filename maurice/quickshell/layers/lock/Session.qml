import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts

Rectangle {
    id: root

    property bool hovered: false
    property var funcs: [
        {
            text: "Z",
            command: ['systemctl', 'suspend']
        },
        {
            text: "L"
        },
        {
            text: "O"
        },
        {
            text: "R"
        },
    ]

    color: D.Colors.surface
    //width: 50
    width: 40
    implicitHeight: (hovered ? funcs.length : 1) * (width)//200
    //height: hovered ? implicitHeight : 50
    radius: D.General.radius

    MouseArea {
        hoverEnabled: true
        //enabled: true
        onHoveredChanged: root.hovered = !root.hovered

        anchors {
            fill: parent
        }

        Column {
            clip: true
            spacing: 5
            width: 50
            anchors {
                fill: parent
                margins: 5
                //top: parent.top
                //bottom: parent.bottom
            }

            Repeater {
                model: root.funcs//root.hovered ? root.funcs : "Z"
                delegate: Rectangle {
                    id: btnCont
                    //visible: (modelData === root.funcs[0]|| root.hovered)
                    //height: root.implicitHeight / root.funcs.length
                    //width: height
                    Layout.fillWidth: true
                    implicitHeight: width ? width : 1
                    color: hovered ? D.Colors.surface : D.Colors.widget
                    property bool hovered: false
                    required property var modelData

                    MouseArea {
                        hoverEnabled: true
                        onHoveredChanged: btnCont.hovered = !btnCont.hovered
                        onClicked: Quickshell.execDetached(btnCont.modelData.command)
                        anchors {
                            margins: 5
                            fill: parent
                        }
                    }

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        left: parent.left
                        right: parent.right
                        //fill: parent

                    }

                    Item {
                        anchors {
                            fill: parent
                            centerIn: parent
                        }
                        Text {
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            font {
                                pointSize: D.General.size
                                family: D.General.family
                            }
                            color: D.Colors.fg
                            anchors {
                                fill: parent
                                centerIn: parent
                            }
                            text: btnCont.modelData.text
                        }
                    }
                }
            }
        }
    }

    anchors {
        margins: 5
        top: parent.top
        right: parent.right
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: D.General.animDur + 80
        }
    }
}
