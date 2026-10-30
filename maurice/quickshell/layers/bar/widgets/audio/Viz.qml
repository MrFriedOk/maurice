import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Item {
    //Text {
    //    text: root.viz
    //    color: D.Colors.fg
    //    anchors {
    //        centerIn: parent
    //        fill: parent
    //    }
    //}
    //width: 100
    //height: parent.height

    id: root

    property var viz: []
    property var vizEnabled: D.General.vizEnabled
    property bool huh: D.General.iHateMyCPU
    property bool playing: player.playbackState == MprisPlaybackState.Playing
    property var player: D.General.player

    anchors {
        fill: parent
    }

    Process {
        command: root.huh ? ['cava', '-p', Quickshell.shellPath('data/iPaidForTheWholeCPU.conf')] : ['cava', '-p', Quickshell.shellPath('data/cava.conf')]
        running: root.playing && root.vizEnabled

        stdout: SplitParser {
            onRead: data => {
                return root.viz = data.split(";").filter(s => {
                    return s !== "";
                }).map(Number);
            }
        }
    }

    Row {
        visible: root.playing && root.vizEnabled
        spacing: 0
        height: parent.height

        Repeater {
            //radius: D.General.radius
            //color: D.Colors.fg
            //property real fade: (-(index + 1) / 100) + 0.7

            model: root.viz

            delegate: Rectangle {
                id: bar

                required property var modelData

                color: D.Colors.fg //Qt.rgba(fade, fade, fade, 1)
                width: 10
                height: 1 + (modelData / 7) * (D.General.barHeight / 1.05)

                anchors {
                    //right: parent.right
                    //left: parent.left
                    //verticalCenter: parent.verticalCenter

                    bottom: parent.bottom
                }

                Behavior on height {
                    NumberAnimation {
                        duration: 80
                    }
                }
            }
        }
    }
}
