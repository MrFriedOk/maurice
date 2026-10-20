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

    implicitWidth: wid.width
    Layout.fillHeight: true

    Wi.Widget {
        id: wid

        text.color: D.Colors.fg
        text.text: "hi"
        icon.text: root.on ? " ON" : " OFF"

        Wi.FadeBehavior on icon.text {
        }

    }

}
