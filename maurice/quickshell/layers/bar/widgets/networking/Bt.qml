import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import "."

Item {
    //visible: on

		id: root
    Timer {
        id: timeout
        interval: 1250
        onTriggered: {
            root.confirmB = false;
        }
    }

    property BluetoothAdapter bt: Bluetooth.defaultAdapter
		property bool on: bt.enabled
    property string id: bt.adapterId
    property string name: bt.name
    property string path: bt.dbusPath
    property bool launcherVis: false
		property bool hovered: false
		property bool confirmB: false
		property list<string> states: ["ON", "OFF"]
    property string state: {
        if (root.on) {
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


    implicitWidth: wid.implicitWidth
		Layout.fillHeight: true
    function confirm() {
        if (root.confirmB) {
            ctl.visible = true;
            if (root.on)
                root.on = false;
            else
                root.on = true;
        }

        //always flip confirm on call
        root.confirmB = !root.confirmB;
				timeout.restart();
				if (root.confirmB){
					ctl.visible = true
				}
			}

			BtPopup{
				id: ctl
				device: root.bt

				anchor{
					item: root
				}
			}

    Wi.Widget {
        //opacity: hover ? 0.8 : 1

        id: wid

        text.color: root.hovered ? D.Colors.surface : D.Colors.fg
        icon.text: "BT"
        icon.color: D.Colors.surface
        text.text: root.state //root.on ? "ON" : "OFF"

        MouseArea {
            id: mArea

            enabled: true
            hoverEnabled: true
            onHoveredChanged: root.hovered = !root.hovered
            onClicked: root.confirm()//root.bt.enabled = !root.bt.enabled

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
