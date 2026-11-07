import "../../../../data" as D
import Quickshell
import QtQuick
import Quickshell.Networking

PopupWindow {
    id: root

    //visible: true
    color: "transparent"
    property var device: null
    property list<string> fields: ["State", "Connected", "Name", "Known"]
    height: 200
    width: 400

    //relativeX: 10
    relativeY: wid.height
    Rectangle {
        anchors {
            fill: parent
        }
        color: D.Colors.widget
        radius: D.General.radius
        Text {
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                topMargin: 5
            }
            horizontalAlignment: Text.AlignHCenter
            text: "Networks"
            font {
                family: D.General.family
                pointSize: 16
            }
            color: D.Colors.fg
        }
        ListView {
            model: device.networks
            spacing: 2
            anchors {
                fill: parent
                margins: 3
                topMargin: 40
            }
            delegate: Rectangle {
                id: delegateNetwork
                required property var modelData

                property list<string> networkContent: [modelData.state.toString(), modelData.connected, modelData.name, modelData.known]
                radius: D.General.radius
                color: D.Colors.bg
                height: 50
                anchors {
                    left: parent.left
                    right: parent.right
                }
                Column {
                    spacing: 5
                    anchors {
                        fill: parent
                        margins: 5
                    }
                    //field
                    Row {
                        spacing: 73
                        anchors {
                            left: parent.left
                            right: parent.right
                        }

                        Repeater {
                            model: root.fields
                            delegate: Text {
                                required property var modelData
                                color: D.Colors.fg
                                text: modelData
                                font {
                                    family: D.General.family
                                }
                            }
                        }
                    }
                    Row {
                        //content
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        spacing: 73

                        Repeater {
                            model: delegateNetwork.networkContent

                            delegate: Text {
                                required property var modelData
                                font {
                                    family: D.General.family
                                }
                                color: D.Colors.fg
                                text: modelData
                            }
                        }
                    }
                }
            }
        }
    }
}
