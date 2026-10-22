import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Item {
    //    Layout.fillWidth: true

    id: root

    property real bat: UPower.displayDevice.percentage
    property string status: toString(UPower.displayDevice.state)
    property real chgRt: UPower.displayDevice.changeRate
    property bool hasBat: UPower.displayDevice.isLaptopBattery
    property real emptTime: UPower.displayDevice.timeToEmpty
    property real chrgTime: UPower.displayDevice.timeToFull
    property string batStr: bat.toFixed(2)
    property int padding: 0
    property bool hovered: false

    function gay() {
        console.log("hi ", status);
        console.log("j ", chgRt);
    }

    visible: hasBat
    implicitWidth: wid.width + padding
    Layout.fillHeight: true

    Wi.Widget {
        id: wid

        icon.text: hovered ? (bat === 1) ? "BAT" : (chrgTime > 0) ? "UP" : "DWN" : "BAT"
        icon.color: {
            if (bat <= 0.1)
                return D.Colors.critical;

            if (bat <= 0.3)
                return D.Colors.warn;

            if (bat <= 0.5)
                return D.Colors.med;
            else
                return D.Colors.surface;
        }
        text.text: hovered ? (bat === 1) ? "FULL" : (chrgTime > 0) ? (chrgTime / 60).toFixed(2) : (emptTime / 60).toFixed(2) : batStr
        text.color: D.Colors.fg
    }

    MouseArea {
        hoverEnabled: true
        onHoveredChanged: {
            root.hovered = !root.hovered;
            gay();
        }

        anchors {
            fill: parent
        }

    }

}
