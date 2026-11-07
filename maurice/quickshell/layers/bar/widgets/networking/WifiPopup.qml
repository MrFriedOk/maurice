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
        Rectangle {
            anchors {
                fill: parent
                margins: 5
            }
            radius: 5
            color: D.Colors.surface
            Rectangle {
                color: D.Colors.bg
                radius: D.General.radius
                height: 30
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    margins: 5
                }
                Text {
                    anchors {
                        fill: parent
                    }
                    horizontalAlignment: Text.AlignHCenter
                    text: "Networks"
                    font {
                        family: D.General.family
                        pointSize: 16
                    }
                    color: D.Colors.fg
                }
                Rectangle {
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                        margins: 5
                    }
                    width: height
                    radius: parent.radius
                    color: closeArea.containsMouse ? D.Colors.widget : D.Colors.surface
                    Behavior on color {
                        ColorAnimation {
                            duration: D.General.animDur
                        }
                    }
                    MouseArea {
                        id: closeArea
                        hoverEnabled: true
                        anchors {
                            fill: parent
                        }
                        onClicked: root.visible = false
                    }
                }
            }
            ListView {
                clip: true
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

                    property string connectState: {
                        if (modelData.connected)
                            return "ya";
                        else
                            return "na";
                    }
                    property string knownState: {
                        if (modelData.known)
                            return "ya";
                        else
                            return "na";
                    }
                    property string state: {
                        ConnectionState.toString(modelData.state);
                    }

                    property list<string> networkContent: [state, connectState, modelData.name, knownState]
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
                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            Repeater {
                                model: root.fields
                                delegate: Text {
                                    width: 112
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

                            Repeater {
                                model: delegateNetwork.networkContent

                                delegate: Text {
                                    width: 112
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
}
