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
    property bool huh: D.General.iHateMyCPU
    property bool playing: player.playbackState == MprisPlaybackState.Playing
    readonly property var player: {
        const list = Mpris.players.values;
        return list.find((p) => {
            return p.playbackState === MprisPlaybackState.Playing;
        }) ?? list[0] ?? null;
    }

    anchors {
        fill: parent
    }

    Process {
        command: root.huh ? ['cava', '-p', Quickshell.shellPath('data/iPaidForTheWholeCPU.conf')] : ['cava', '-p', Quickshell.shellPath('data/cava.conf')]
        running: root.playing

        stdout: SplitParser {
            onRead: (data) => {
                return root.viz = data.split(";").filter((s) => {
                    return s !== "";
                }).map(Number);
            }
        }

    }

    Row {
        visible: root.playing
        spacing: 0
        height: parent.height

        Repeater {
            model: root.viz

            delegate: Rectangle {
                required property var modelData

                width: 10
                height: 1 + (modelData / 7) * (D.General.barHeight / 1.25)
                //radius: D.General.radius
                color: D.Colors.fg

                anchors {
                    //bottom: parent.bottom

                    //right: parent.right
                    //left: parent.left
                    verticalCenter: parent.verticalCenter
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
