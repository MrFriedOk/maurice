import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Networking

Item {
    id: root

    function confirm() {
        if (state === states[0])
            state = statesToggle[1];
        if (state === states[1])
            state = statesToggle[0];

        if (state === statesToggle)
            Networking.wifiEnabled = !Networking.wifiEnabled;

        if (wifiOn)
            state = states[0];
        else
            state = states[1];

        //wid.text.text = root.wifiOn ? "OFF?" : "ON?";

        //if (wid.text.text === "OFF?" || wid.text.text === "ON?")
        //    Networking.wifiEnabled = !Networking.wifiEnabled;

        //root.wifiOn = Networking.wifiEnabled;
    }

    property bool eth: false
    property string netName: NetworkDevice.name
    property bool wifiOn: Networking.wifiEnabled
    property bool hovered: false

    implicitWidth: wid.implicitWidth
    Layout.fillHeight: true

    property list<string> states: ["ON", "OFF"]
    property list<string> statesToggle: ["ON?", "OFF?"]
    property string state: {
        if (root.wifiOn)
            return states[0];
        else
            return states[1];
    }

    PopupWindow {
        id: ctl
    }

    Wi.Widget {
        id: wid

        //opacity: root.hovered ? 0.8 : 1
        text.text: root.state //root.wifiOn ? //root.states[0] : root.states[1] //"ON" : "OFF"
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
