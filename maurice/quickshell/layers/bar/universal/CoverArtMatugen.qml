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
    //Connections {
    //function onTrackArtUrlChanged() {
    //    if (root.art && !matugen.running) {
    //        matugen.url = root.art;
    //        matugen.running = true;
    //    }
    //target: root.player
    //}

    id: root

    readonly property var player: D.General.player
    readonly property string art: player.trackArtUrl
    readonly property real length: player.length
    readonly property real pos: player.position

    onArtChanged: {
        if (root.art && !matugen.running) {
            matugen.url = root.art;
            buffer.running = true;
        }
    }

    Timer {
        id: buffer

        interval: 250
        onTriggered: matugen.running = true
    }

    Process {
        //["matugen", "image", "${root.art}", "--source-color-index", "1"]
        //["sh", Quickshell.shellPath('data/art.sh'), matugen.url];
        //console.log("hi", root.art, "no", matugen.url);
        //if (root.art.startsWith("https"))
        //    return ['matugen', 'web-image', root.art, 'source-color-index', '1'];
        // ["sh", Quickshell.shellPath('data/thing.sh'), matugen.url];

        id: matugen

        property var url: root.art
        property string scheme: "scheme-%1".arg(D.General.scheme)
        property string configDir: Quickshell.shellPath('data')

        //running: (root.art && !running)
        command: {
            console.log("hui", matugen.url);
            ["sh", Quickshell.shellPath('data/art.sh'), matugen.url, matugen.scheme, matugen.configDir];
        }
        onExited: (code, status) => {
            return console.log("art.sh exited", code);
        }

        stderr: SplitParser {
            onRead: (data) => {
                return console.log("art.sh:", data);
            }
        }

    }

}
