import QtQuick
import Quickshell
import Quickshell.Services.Mpris
pragma Singleton

//general stuff, prolly should sort out later
Singleton {
    id: gen

    property string family: "Maple Mono NF"
    property bool adaptPS: true
    property int size: adaptPS ? barHeight / 2 : 10
    property int txtSpacing: 5
    property bool bold: false
    property int spacing: 2
    property int radius: 0
    property int animDur: 80
    property int barHeight: 35
    property bool widRect: sketchBar ? false : true
    property bool outline: sketchBar ? false : false
    property bool sketchBar: false
    property bool iHateMyCPU: false && vizEnabled
    property bool vizEnabled: false
    readonly property var player: {
        const list = Mpris.players.values;
        return list.find((p) => {
            return p.playbackState === MprisPlaybackState.Playing;
        }) ?? list[0] ?? null;
    }
}
