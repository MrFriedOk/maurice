import QtQuick
import Quickshell
import Quickshell.Io
import "."
import "../../data" as D

PanelWindow {
    color: "transparent"
    property string lrc: fetch.fetch(D.General.player)
    exclusionMode: ExclusionMode.Ignore
    visible: false//D.General.lyrics
    anchors {
        left: true
    }
    width: 300
    height: 800
    Rectangle {
        anchors {
            fill: parent
        }
        color: D.Colors.bg
    }
    Fetch {
        id: fetch
    }
}
