import Quickshell
import QtQuick
import "."
import "../../data" as D

Flickable {
    property var activeWin: ''
    anchors {
        fill: parent
    }
    contentHeight: 2000
    clip: true
    General {
        visible: false//true
    }
    Visualizer {
        visible: true
    }
}
