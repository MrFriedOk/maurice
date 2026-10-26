import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Scope {
    id: root

    property var player: D.General.player
    property string art: player.trackArtUrl
}
