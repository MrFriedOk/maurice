import QtQuick
import Quickshell
import "../../data" as D
import "."

Column {
    id: root
    anchors {
        fill: parent
    }
    property var switches: [
        {
            assigned: D.General.iHateMyCPU,
            //onToggled: assigned => D.General.iHateMyCPU = assigned,
            //toggle: assigned,
            name: "cpu"
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
                assigned: row.modelData.assigned
                onToggled: assigned => assigned = assigned
                //row.modelData.toggle = assigned
            }
        }
    }
}
