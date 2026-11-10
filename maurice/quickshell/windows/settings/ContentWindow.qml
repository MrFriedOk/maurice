import Quickshell
import QtQuick
import "."
import "../../data" as D

Flickable {
    id: root
    //lol property bool activeWin: []
    //property bool general: true
    //property bool visualizer: false
    property string content: "General.qml"
    anchors {
        fill: parent
    }
    contentHeight: 2000
    clip: true
    Loader {
        id: contentLoader
        anchors {
            fill: parent
        }
        source: root.content //"General.qml"
    }
}
