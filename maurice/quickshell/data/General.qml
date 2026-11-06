pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Mpris
import Quickshell.Io
import "../windows/settings/" as S

//general stuff, prolly should sort out later
Singleton {
    //"Maple Mono NF"
    //Behavior on barHeight {
    //    NumberAnimation {
    //        duration: animDur
    //    }
    //}

    id: gen

    function toggle(property) {
        //settings = !settings;
        //property = !property;
        gen[property] = !gen[property];
    }
    property bool settings: false
    readonly property string version: "0.4.0"
    property bool lyrics: true
    property bool dash: false
    property bool notificationsLauncher: true
    readonly property list<string> splashes: JSON.parse(splashesJson.text())//JSON.parse(Quickshell.shellPath('data/splashes.json'))
    //property int loopState: player.loopState
    property alias family: adapter.family
    property alias scheme: adapter.scheme
    property alias adaptPS: adapter.adaptPS
    property alias size: adapter.size
    property alias bold: adapter.bold
    property alias spacing: adapter.spacing
    property alias radius: adapter.radius
    property alias animDur: adapter.animDur
    property alias barHeight: adapter.barHeight
    property alias widRect: adapter.widRect
    property alias outline: adapter.outline
    property alias sketchBar: adapter.sketchBar
    property alias iHateMyCPU: adapter.iHateMyCPU
    property alias vizEnabled: adapter.vizEnabled
    property alias adaptiveWall: adapter.adaptiveWall
    readonly property var player: {
        const list = Mpris.players.values;
        return list.find(p => {
            return p.playbackState === MprisPlaybackState.Playing;
        }) ?? list[0] ?? null;
    }

    FileView {
        //id: file
        path: Quickshell.shellPath('data/general.json')
        watchChanges: true
        blockLoading: true
        onFileChanged: reload()
        onAdapterUpdated: writeAdapter()

        adapter: JsonAdapter {
            id: adapter

            property string scheme: "fruit-salad"

            property string family: font.name
            property bool adaptPS: true
            //property var fonts: [font.name] //["SpaceMono Nerd Font", "Maple Mono NF", "Red Hat Text", "Readex Pro", "OpenDyslexic Nerd Font", "Atkinson Hyperlegible"]
            property int size: adaptPS ? barHeight / 2 : 10
            property int txtSpacing: 5
            property bool bold: false
            property int spacing: 2
            property int radius: 4
            property int animDur: 80
            property int barHeight: 20
            property bool widRect: sketchBar ? false : true
            property bool outline: sketchBar ? false : false
            property bool sketchBar: false
            property bool iHateMyCPU: true //&& vizEnabled
            property bool vizEnabled: false
            property bool adaptiveWall: true
        }
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
