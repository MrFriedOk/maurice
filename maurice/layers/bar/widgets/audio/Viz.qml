import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import Quickshell
import Quickshell.Io

Item {
    //Text {
    //    text: root.viz
    //    color: D.Colors.fg
    //    anchors {
    //        centerIn: parent
    //        fill: parent
    //    }
    //}

    id: root

    property var viz: []

    //width: 100
    //height: parent.height
    anchors {
        fill: parent
    }

    Process {
        command: ['cava', '-p', Quickshell.shellPath('cava.conf')]
        running: true

        stdout: SplitParser {
            onRead: (data) => {
                return root.viz = data.split(";").filter((s) => {
                    return s !== "";
                }).map(Number);
            }
        }

    }

    Row {
        spacing: 1

        Repeater {
            model: root.viz

            delegate: Rectangle {
                required property var modelData

                width: 5
                height: 1 + (modelData / 7) * 16
                radius: D.General.radius
                color: D.Colors.fg

                Behavior on height {
                    NumberAnimation {
                        duration: D.General.animDur
                    }

                }

            }

        }

    }

}
