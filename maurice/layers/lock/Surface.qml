import "../../data" as D
import "../bar/universal/" as Wi
import "./" as Self
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

WlSessionLockSurface {
    //color: "#aa000000"

    Rectangle {
        //	height: 10
        //Layout.fillWidth: true
        //Layout.fillHeight: true
        //escape box
        //	width: 25

        Self.Session {
        }
        //MouseArea{

        anchors {
            fill: parent
        }

        //	enabled: true
        //anchors{
        //	top: parent.top
        //	left: parent.left
        //}
        //Rectangle{
        //	anchors{
        //		fill: parent
        //	}
        //}
        //onHoveredChanged: parent.color: "green"
        //onClicked: root.locked = false
        //}
        Rectangle {
            //BackgroundEffect.blurRegion: Region{item: bg.contentItem}

            id: other

            color: "transparent"

            Self.Playback {
            }

            Self.PamContainer {
            }
            //id: bg

            anchors {
                fill: parent
            }
            //"#bb000000"

        }

        Rectangle {
            //clock
            color: D.Colors.surface
            height: 200
            width: 500
            radius: D.General.radius + 9

            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
                topMargin: 100
            }

            Wi.Scramble {
                id: clockTxt

                target: Qt.formatTime(clock.date, "hh:mm")
                font.pointSize: 96
                color: D.Colors.fg
                fpc: 3
                font.family: root.curFont

                anchors {
                    horizontalCenter: parent.horizontalCenter
                    verticalCenter: parent.verticalCenter
                }

                Timer {
                    interval: 1000
                    running: false
                    repeat: true
                    onTriggered: {
                        let next;
                        do {
                            next = root.fonts[Math.floor(Math.random() * root.fonts.length)];
                        } while (next === root.curFont)
                        root.curFont = next;
                    }
                }

            }

        }

        gradient: Gradient {
            GradientStop {
                position: 0
                color: D.Colors.fg
            }

            GradientStop {
                position: 1
                color: D.Colors.accent
            }

        }
        //	visible: false

    }

}
