import "../../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Scope {
    //readonly property string path: "%1".arg(art)
    //FileView {
    //     path: root.art
    //     onPathChanged: matugen.running = true
    // }

    id: root

    readonly property var player: D.General.player
    readonly property string art: player.trackArtUrl
    readonly property real length: player.length
    readonly property real pos: player.position

    Process {
        //["matugen", "image", "${root.art}", "--source-color-index", "1"]
        //["sh", Quickshell.shellPath('data/art.sh'), matugen.url];
        //console.log("hi", root.art, "no", matugen.url);
        //if (root.art.startsWith("https"))
        //  return ['matugen', 'web-image', root.art, 'source-color-index', '1'];

        id: matugen

        property string url: ""

        running: true
        command: {
            console.log("hui", root.art);
        }
    }

    Connections {
        function onTrackArtUrlChanged() {
            if (root.art && !matugen.running) {
                matugen.url = root.art;
                matugen.running = true;
            }
        }

        target: root.player
    }

}
