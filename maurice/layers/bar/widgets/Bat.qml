import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.UPower

Item {
    //    Layout.fillWidth: true

    property real bat: UPower.displayDevice.percentage
    property UPowerDeviceState status: UPowerDevice.state
    property string batStr: bat.toFixed(2)
    property int padding: 0

    implicitWidth: wid.implicitWidth + padding
    Layout.fillHeight: true

    Wi.Widget {
        id: wid

        icon.text: "BAT"
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
        text.text: batStr
        text.color: D.Colors.fg
    }

}
