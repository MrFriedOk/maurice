import "../../../../data" as D
import Quickshell
import QtQuick
import Quickshell.Networking

PopupWindow {
    id: root

    //visible: true
    color: "transparent"
    property var device: null
    property list<string> fields: ["State", "Device", "Name", "Known"]
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
                    //close button
                    anchors {
                        top: parent.top
                        bottom: parent.bottom
                        right: parent.right
                        margins: 5
                    }
                    Text {

                        font {
                            family: D.General.family
                        }
                        color: D.Colors.fg
                        anchors {
                            fill: parent
                        }
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "x"
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
                Rectangle {
                    //rescan networks button
                    color: scanArea.containsMouse ? D.Colors.widget : D.Colors.surface
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                        margins: 5
                    }
                    width: txt.implicitWidth + height//height
                    radius: D.General.radius
                    Behavior on color {
                        ColorAnimation {
                            duration: D.General.animDur
                        }
                    }
                    Text {
                        id: txt
                        font {
                            family: D.General.family
                        }
                        color: D.Colors.fg
                        anchors {
                            fill: parent
                        }
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                        text: "Rescan"
                    }
                    MouseArea {
                        id: scanArea
                        anchors {
                            fill: parent
                        }
                        hoverEnabled: true
                        onClicked: Networking.checkConnectivity()
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

                    //property string connectState: {
                    //    if (modelData.connected)
                    //        return "ya";
                    //    else
                    //        return "na";
                    //}
                    property string knownState: {
                        if (modelData.known)
                            return "ya";
                        else
                            return "na";
                    }
                    property string state: {
                        ConnectionState.toString(modelData.state);
                    }
                    property string device: modelData.device.name

                    property list<string> networkContent: [state, device, modelData.name, knownState]
                    radius: D.General.radius
                    color: networkArea.containsMouse ? D.Colors.widget : D.Colors.bg
                    Behavior on color {
                        ColorAnimation {
                            duration: D.General.animDur
                        }
                    }
                    MouseArea {
                        id: networkArea
                        anchors {
                            fill: parent
                        }
                        hoverEnabled: true
                        onClicked: {
                            if (delegateNetwork.modelData.connected)
                                delegateNetwork.modelData.disconnect();
                            else
                                delegateNetwork.modelData.connect();
                        }
                    }
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
