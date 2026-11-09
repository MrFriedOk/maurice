import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking

Item {
    id: root

    Timer {
        id: timeout
        interval: 1250
        onTriggered: {
            root.confirmB = false;
        }
    }

    function confirm() {
        if (root.confirmB) {
            if (root.wifiOn)
                Networking.wifiEnabled = false;
            else
                Networking.wifiEnabled = true;
        }

        //always flip confirm on call
        root.confirmB = !root.confirmB;
        timeout.restart();
        if (root.confirmB) {
            ctl.visible = true;
        }
    }

    property bool hi: false
    //property string netName: NetworkDevice.name
    property bool wifiOn: Networking.wifiEnabled
    property bool hovered: false
    property bool confirmB: false
    readonly property var device: Networking.devices.values.find(d => d.connected) ?? null
    //property NetworkDevice device: NetworkDevice

    implicitWidth: wid.implicitWidth
    Layout.fillHeight: true

    property list<string> states: ["ON", "OFF"]
    //property list<string> statesToggle: ["ON?", "OFF?"]
    property string state: {
        if (root.wifiOn) {
            if (root.confirmB)
                return states[1] + "?";
            else
                return states[0];
        } else {
            if (root.confirmB)
                return states[0] + "?";
            else
                return states[1];
        }
    }

    InternetPopup {
        id: ctl
        device: root.device

        anchor {
            item: root
        }
    }

    Wi.Widget {
        id: wid

        //opacity: root.hovered ? 0.8 : 1
        text.text: root.state //root.wifiOn ? //root.states[0] : root.states[1] //"ON" : "OFF"
        icon.text: {
            if (root.device.type === DeviceType.Wifi)
                return "WIFI";
            if (root.device.type === DeviceType.Wired)
                return "WIRE";
            else {
                return "NONE";
            }
        }
        text.color: root.hovered ? D.Colors.surface : D.Colors.fg
        icon.color: D.Colors.surface
        Wi.FadeBehavior on text.text {}

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: hovered = !hovered
            onClicked: {
                root.confirm();
                //ctl.visible = !ctl.visible;
            }//Networking.wifiEnabled = !Networking.wifiEnabled

            anchors {
                fill: parent
            }
        }
    }
}
