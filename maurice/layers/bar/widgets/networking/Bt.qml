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
    property bool hover: false

    implicitWidth: wid.width
    Layout.fillHeight: true

    Wi.Widget {
        id: wid

        text.color: D.Colors.fg
        text.text: "hi"
        icon.color: D.Colors.surface
        icon.text: root.on ? "ON" : "OFF"
        opacity: hover ? 0.8 : 1

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: root.hover = !root.hover

            anchors {
                fill: parent
            }

        }

        Behavior on opacity {
            NumberAnimation {
              duration: D.General.animDur
            }

        }

        Wi.FadeBehavior on text.text {
        }

    }

}
