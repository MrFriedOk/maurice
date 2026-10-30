import "../../data" as D
import "../bar/universal/" as Wi
import "./" as Self
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Io

WlSessionLockSurface {
    //color: "#aa000000"

    Rectangle {
        id: rootRect
        property var viz: []
        property list<int> band: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]
        property real avg: 0
        property int lo: 2
        property int hi: 25
        property real sensitivity: 1.3
        property real floor: 30
        property int cooldownMs: 150
        property int holdMs: 120
        property real alpha: 0.02

        property real band: 0
        property real avg: 0
        property bool beat: false

        property real _last: 0
        Process {
            running: D.General.iHateMyCPU
            command: ["cava", "-p", Quickshell.shellPath('data/lock.conf')]
            stdout: SplitParser {
                onRead: d => {
                    return rootRect.viz = d.split(";").filter(s => {
                        return s !== "";
                    }).map(Number);
                }
            }
        }
        Row {
            id: vizRow
            spacing: 1
            anchors {
                fill: parent
                leftMargin: vizRow.spacing
            }
            readonly property bool beat: //(rootRect.viz[2 .. 25] > 30)
            Repeater {
                model: rootRect.viz

                delegate: Rectangle {
                    id: delegateRt
                    required property var modelData
                    required property int index
                    anchors {
                        bottom: parent.bottom
                    }

                    color: D.Colors.light
                    width: (parent.width / rootRect.viz.length) - vizRow.spacing
                    height: 2 + (modelData * 6)//higher num makes bars more aggressive :3 (they also peak faster :c)
                }
            }
        }
        //	height: 10
        //Layout.fillWidth: true
        //Layout.fillHeight: true
        //escape box
        //	width: 25

        Self.Session {}
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

            Self.Playback {}

            Self.PamContainer {}
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
                color: (vizRow.beat) ? D.Colors.light : D.Colors.fg
                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
            }

            GradientStop {
                position: 1
                color: D.Colors.accent
            }
        }
        //	visible: false

    }
}
