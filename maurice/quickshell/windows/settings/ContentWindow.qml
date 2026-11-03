import Quickshell
import QtQuick
import "."
import "../../data" as D

Flickable {
    id: root
    //lol property bool activeWin: []
    property bool general: true
    property bool visualizer: false
    anchors {
        fill: parent
    }
    contentHeight: 2000
    clip: true
    General {
        visible: root.general
    }
    Visualizer {
        visible: root.general
    }
}
