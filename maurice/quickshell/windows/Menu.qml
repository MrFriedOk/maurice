import Quickshell
import QtQuick
import Quickshell.Hyprland
import Quickshell.Wayland
import "../data" as D

PanelWindow {
    id: root
    exclusionMode: ExclusionMode.Ignore
    GlobalShortcut {
        appid: "maurice"
        name: "menu"
        description: "bring up the menu"
        onPressed: root.open = !root.open
    }
    property bool open: false
    property real p: open ? 1 : 0
    Behavior on p {
        NumberAnimation {
            duration: 300
            easing: Easing.InOutQuad
        }
    }

    //WlrLayershell.layer: WlrLayer.Top
    visible: root.open || root.p > 0

    //exclusionMode: ExlcusionMode.Ignore
    color: "transparent"
    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }
    Rectangle {
        color: D.Colors.fg
        anchors {
            fill: parent
        }
        opacity: root.p
        //scale: .90 + .10 * root.p
        //x: root.p * 300
        Row {
            anchors {
                fill: parent
            }
            //width: title.implicitWidth + blink.implicitWidth
            //height: 500
            spacing: 5
            Text {
                id: title
                width: implicitWidth
                property int chars: 0
                text: "maurice".slice(0, chars)
                color: D.Colors.surface
                font {
                    pointSize: 96
                    family: D.General.family
                }// typewriter effect

                states: State {
                    name: "shown"
                    when: root.p >= 1                      // fully open
                    PropertyChanges {
                        target: title
                        chars: 7
                    }
                }
                transitions: Transition {
                    to: "shown"
                    SequentialAnimation {
                        PauseAnimation {
                            duration: 100
                        }        // let the panel settle first
                        NumberAnimation {
                            property: "chars"
                            duration: (Math.random() * (600 - 400 + 1)) + 400
                        }
                        // add steps here: a glow sweep, a color flash, a sound...
                    }
                }
            }
            Text {
                id: blink
                visible: title.chars === 7
                property list<string> texts: [" ", "_"]
                property int index: 1

                Behavior on x {
                    NumberAnimation {
                        duration: 120
                    }
                }
                font {
                    pointSize: 96
                    family: D.General.family
                }
                text: texts[index]
                color: D.Colors.surface

                Timer {
                    interval: 600
                    repeat: true
                    running: root.open

                    onTriggered: blink.index = (blink.index + 1) % blink.texts.length
                }
            }
        }
    }
}
