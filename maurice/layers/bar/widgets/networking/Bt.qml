import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth

Item {
    //visible: on

    id: root

    property var bt: Bluetooth.defaultAdapter
    property bool on: bt.enabled
    property string id: bt.adapterId
    property string name: bt.name
    property string path: bt.dbusPath
    property bool launcherVis: false
    property bool hovered: false

    implicitWidth: wid.implicitWidth
    Layout.fillHeight: true

    Wi.Widget {
        //opacity: hover ? 0.8 : 1

        id: wid

        text.color: root.hovered ? D.Colors.surface : D.Colors.fg
        icon.text: "BT"
        icon.color: D.Colors.surface
        text.text: root.on ? "ON" : "OFF"

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: root.hovered = !root.hovered
            onClicked: root.bt.enabled = !root.bt.enabled

            anchors {
                fill: parent
            }

        }

        Behavior on text.color {
            ColorAnimation {
                duration: D.General.animDur
            }

        }

        Wi.FadeBehavior on text.text {
        }

    }

}
