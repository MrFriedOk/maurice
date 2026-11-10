import QtQuick
import Quickshell
import Quickshell.Io
import "."
import "../../data" as D

PanelWindow {
    id: root
    color: "transparent"
    property string lrc: "hi"//fetch.fetch(D.General.player)
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
        Text {
            anchors {
                fill: parent
            }
            font {
                family: D.General.family
                pointSize: 8
            }
            color: D.Colors.fg
            text: root.lrc
        }
    }
    //Fetch {
    //    id: fetch
    //}
}
