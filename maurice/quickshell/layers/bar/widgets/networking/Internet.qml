import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking

Item {
    id: root

    function confirm() {
        wid.text.text = root.wifiOn ? "OFF?" : "ON?";

        if (wid.text.text === "OFF?" || wid.text.text === "ON?")
            Networking.wifiEnabled = !Networking.wifiEnabled;
        else
            ctl.visible = true;

        root.wifiOn = Networking.wifiEnabled;
    }

    property bool eth: false
    property string netName: NetworkDevice.name
    property bool wifiOn: Networking.wifiEnabled
    property bool hovered: false

    implicitWidth: wid.implicitWidth
    Layout.fillHeight: true

    PopupWindow {
        id: ctl
    }

    Wi.Widget {
        id: wid

        //opacity: root.hovered ? 0.8 : 1
        text.text: root.wifiOn ? "ON" : "OFF"
        icon.text: "WIFI"
        text.color: root.hovered ? D.Colors.surface : D.Colors.fg
        icon.color: D.Colors.surface

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: hovered = !hovered
            onClicked: {
                root.confirm();
                ctl.visible = !ctl.visible;
            }//Networking.wifiEnabled = !Networking.wifiEnabled

            anchors {
                fill: parent
            }
        }

        Behavior on text.color {
            ColorAnimation {
                duration: D.General.animDur
            }
        }
    }
}
