pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Io

//general stuff, prolly should sort out later
Singleton {
    //"Maple Mono NF"
    //Behavior on barHeight {
    //    NumberAnimation {
    //        duration: animDur
    //    }
    //}

    id: gen

    property string family: font.name
    readonly property list<string> splashes: JSON.parse(splashesJson.text())//JSON.parse(Quickshell.shellPath('data/splashes.json'))
    property string scheme: "fruit-salad"
    property bool adaptPS: true
    //property var fonts: [font.name] //["SpaceMono Nerd Font", "Maple Mono NF", "Red Hat Text", "Readex Pro", "OpenDyslexic Nerd Font", "Atkinson Hyperlegible"]
    property int size: adaptPS ? barHeight / 2 : 10
    property int txtSpacing: 5
    property bool bold: false
    property int spacing: 2
    property int radius: 0
    property int animDur: 80
    property int barHeight: 20
    property bool widRect: sketchBar ? false : true
    property bool outline: sketchBar ? false : false
    property bool sketchBar: false
    property bool iHateMyCPU: true //&& vizEnabled
    property bool vizEnabled: false
    property bool adaptiveWall: true
    //property int loopState: player.loopState
    readonly property var player: {
        const list = Mpris.players.values;
        return list.find(p => {
            return p.playbackState === MprisPlaybackState.Playing;
        }) ?? list[0] ?? null;
    }

    FontLoader {
        id: font

        source: Quickshell.shellPath("data/assets/fonts/MapleMono-NF/MapleMono-NF-Regular.ttf")
    }

    FileView {
        id: splashesJson
        path: Quickshell.shellPath('data/splashes.json')
        //	JsonAdapter{

        //}
    }
}
