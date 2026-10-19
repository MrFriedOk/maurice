import "../../../data/" as D
import "../universal/" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    //    Layout.fillWidth: true
    //    Layout.fillHeight: true

    id: wid

    property string status: "SUSP"
    property int padding: 0
    property bool hover: false
    property bool hasIcon: true

    //    implicitHeight: 10
    Layout.fillHeight: true
    implicitWidth: ses.implicitWidth + padding

    Process {
        id: systemctl

        command: {
            if (status === "SUSP")
                return ["systemctl", "suspend"];

            if (status === "OFF")
                return ["poweroff"];

            if (status === "RST")
                return ["reboot"];

            if (status === "OSU!")
                return ["/home/fried/osu.sh"];

        }
    }

    MouseArea {
        hoverEnabled: true
        enabled: true
        anchors.fill: parent
        onHoveredChanged: wid.hover = !wid.hover
        onClicked: systemctl.running = true

        Wi.Widget {
            id: ses

            text.text: status
            text.color: hover ? D.Colors.surface : D.Colors.fg
            color: hover ? D.Colors.surface : D.Colors.widget
            icon.text: wid.hasIcon ? "SES" : ""
            icon.color: D.Colors.surface

            Behavior on text.color {
                ColorAnimation {
                    duration: 120
                }

            }

            Behavior on color {
                ColorAnimation {
                    duration: 120
                }

            }

        }

    }

}
