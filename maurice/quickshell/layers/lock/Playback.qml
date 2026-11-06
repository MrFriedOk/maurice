import "../../data" as D
import "../bar/universal" as Wi
import "./" as Self //idk why tf i named it self
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Rectangle {
    id: root

    property bool locking: false
    property var player: D.General.player
    property int loopState: player.loopState
    property string loop: {
        if (loopState === 1)
            return "LOOP 1";

        if (loopState === 0)
            return "OFF";

        if (loopState === 2)
            return "LOOP";
    }
    property string art: player.trackArtUrl
    property string pause: player.isPlaying ? "PAUSE" : "PLAY"
    property int margin: 5

    color: D.Colors.surface
    width: 1000
    height: 400
    radius: D.General.radius

    anchors {
        centerIn: parent
        verticalCenterOffset: 100
    }

    Self.Control {}

    Rectangle {
        id: artContainer

        //cover art
        color: D.Colors.surface
        width: parent.height
        radius: parent.radius

        Image {
            id: fart
            cache: false
            clip: true
            source: root.art

            anchors {
                fill: parent
            }
            ShaderEffect {
                fragmentShader: Quickshell.shellPath('data/halftone.frag')
                anchors.fill: parent
                property var source: ShaderEffectSource {
                    sourceItem: fart
                    hideSource: false
                }
                property size size: Qt.size(width, height)
                property real cell: 2
                property real angle: 0.785
            }
        }

        anchors {
            margins: root.margin
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }
}
