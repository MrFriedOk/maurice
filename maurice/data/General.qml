import QtQuick
import Quickshell
pragma Singleton

//general stuff, prolly should sort out later
Singleton {
    property string family: "Maple Mono NF"
    property int size: barHeight / 2
    property bool bold: false
    property int spacing: 2
    property int radius: 2
    property int animDur: 80
    property int barHeight: 25
    property bool widRect: false
}
