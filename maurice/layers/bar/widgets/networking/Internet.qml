import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking

Item {
    id: root

    property bool eth: false
    property string netName: NetworkDevice.name
    property bool wifiOn: Networking.wifiEnabled
    property bool hovered: false

    implicitWidth: wid.width
    Layout.fillHeight: true

    Wi.Widget {
        id: wid

        opacity: root.hovered ? 0.8 : 1
        icon.text: wifiOn ? "ON" : "OFF"
        text.text: root.netName

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: hovered = !hovered
            onClicked: Networking.wifiEnabled = !Networking.wifiEnabled

            anchors {
                fill: parent
            }

        }

    }

}
