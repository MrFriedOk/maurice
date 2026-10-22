import QtQuick
import Quickshell
pragma Singleton

//general stuff, prolly should sort out later
Singleton {
    id: gen

    property string family: "Maple Mono NF"
    property bool adaptPS: false
    property int size: adaptPS ? barHeight / 2 : 10
    property int txtSpacing: 5
    property bool bold: false
    property int spacing: 2
    property int radius: 1
    property int animDur: 80
    property int barHeight: 35
    property bool widRect: sketchBar ? false : true
    property bool outline: sketchBar ? false : false
    property bool sketchBar: false
}
