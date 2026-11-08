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
            toggle: "bold",
            name: "Bold Lettering",
            tooltip: "Use bold letters? Not yet \nproperly implemented with font."
        },
        {
            toggle: "adaptPS",
            name: "Adapt Point Size",
            tooltip: "Adapt the point size to bar height? \nwont do anything with defaults"
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
