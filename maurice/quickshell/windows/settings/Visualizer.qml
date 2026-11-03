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
            toggle: "iHateMyCPU" //D.General.iHateMyCPU,
            ,
            //onToggled: assigned => D.General.iHateMyCPU = assigned,
            //toggle: assigned,
            name: "Do you hate your CPU?"
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
        }
    }
}
