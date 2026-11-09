import Quickshell
import QtQuick
import "../../data" as D
import "."
import "./general" as G

Column {
    id: root
    G.Field {}
    spacing: 5
    anchors {
        fill: parent
        margins: 5
    }
    property var switches: [
        {
            toggle: "adaptiveWall",
            name: "Use 'adaptive wallpaper'",
            tooltip: "Use the gradient wallpaper \nor low res album art?"
        },
    ]
    Repeater {
        model: root.switches

        delegate: Row {
            id: row
            required property var modelData
            anchors {
                left: parent.left
                right: parent.right
            }
            G.Switch {
                assigned: D.General[row.modelData.toggle]//D.General.iHateMyCPU//row.modelData.toggle
                onToggled: assigned => D.General[row.modelData.toggle] = assigned
                //row.modelData.toggle = assigned
            }
            G.Info {
                hint: row.modelData.name
                tooltip: row.modelData.tooltip
            }
        }
    }
}
