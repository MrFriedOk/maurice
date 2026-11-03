import QtQuick
import Quickshell
import "../../data" as D
import "."

Column {
    id: root
    spacing: 5
    anchors {
        fill: parent
        margins: 5
    }
    property var switches: [
        {
            toggle: "iHateMyCPU" //D.General.iHateMyCPU,
            ,
            //onToggled: assigned => D.General.iHateMyCPU = assigned,
            //toggle: assigned,
            name: "Do you hate your CPU?",
            tooltip: "Check if you want your lock screen to be crazy and stuff and destroy your compute!"
        },
        {
            toggle: "vizEnabled",
            name: "Visualizer",
            tooltip: "Do YOU want the playback widget to visualize?"
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
            Switch {
                assigned: D.General[row.modelData.toggle]//D.General.iHateMyCPU//row.modelData.toggle
                onToggled: assigned => D.General[row.modelData.toggle] = assigned
                //row.modelData.toggle = assigned
            }
            Info {
                hint: row.modelData.name
                tooltip: row.modelData.tooltip
            }
        }
    }
}
