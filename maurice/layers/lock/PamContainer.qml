import "../../data" as D
import QtQuick
import Quickshell

Rectangle {
    //pam container

    color: D.Colors.surface
    radius: D.General.radius
    width: 400
    height: 50

    Rectangle {
        color: D.Colors.bg

        Row {
            //transform: Translate {
            //    id: shift
            //}
            //width: 5

            id: shapes

            spacing: 6

            anchors {
                //centerIn: parent

                //fill: parent
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: shapes.spacing
            }

            Repeater {
                model: 24

                delegate: Item {
                    id: slot

                    required property int index
                    readonly property bool filled: index < ctx.length
                    property int shape: 0

                    onFilledChanged: {
                        if (filled)
                            shape = Math.floor(Math.random() * 3);

                    }
                    width: 20
                    height: width
                    scale: filled ? 1 : 0

                    Rectangle {
                        id: thing

                        color: D.Colors.fg //"white"
                        visible: slot.shape === 0
                        radius: D.General.radius + 3

                        SequentialAnimation {
                            ColorAnimation {
                                duration: D.General.animDur
                            }

                        }

                        anchors {
                            fill: parent
                        }

                        ColorAnimation {
                            duration: D.General.animDur
                        }

                    }

                    Rectangle {
                        color: D.Colors.fg
                        visible: slot.shape === 1
                        radius: D.General.radius + 2

                        anchors {
                            fill: parent
                        }

                    }

                    Rectangle {
                        color: D.Colors.fg
                        visible: slot.shape === 2
                        radius: D.General.radius

                        anchors {
                            fill: parent
                        }

                    }

                    Behavior on scale {
                        NumberAnimation {
                            duration: D.General.animDur
                        }

                    }

                }

            }

        }

        anchors {
            fill: parent
            margins: 5
        }

        TextInput {
            id: pam

            //text: "hi"
            color: D.Colors.fg
            focus: true
            cursorVisible: false
            Component.onCompleted: forceActiveFocus()
            onAccepted: {
                ctx.submit(text);
                text = "";
            }
            enabled: !ctx.busy
            echoMode: TextInput.Password
            inputMethodHints: Qt.ImhSensitiveData
            onTextChanged: ctx.length = text.length
            opacity: 0

            anchors {
                fill: parent
                verticalCenter: parent.verticalCenter
            }

        }

    }

    anchors {
        bottomMargin: 50
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }

}
