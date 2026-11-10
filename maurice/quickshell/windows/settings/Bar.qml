import QtQuick
import Quickshell
import "../../data" as D
import "."
import "./general" as G

Column {
    id: root
    spacing: 5
    anchors {
        fill: parent
        margins: 5
    }
    property var switches: [
        {
            toggle: "sketchBar",
            name: "Enable bar 'sketching'",
            tooltip: "'Sketching' refers to widgets being \ntransparent, so you just see text."
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
                assigned: D.General[row.modelData.toggle]
                onToggled: assigned => D.General[row.modelData.toggle] = assigned
            }
            G.Info {
                hint: row.modelData.name
                tooltip: row.modelData.tooltip
            }
        }
    }
}
