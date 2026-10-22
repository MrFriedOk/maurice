import "../../../data/" as D
import "../universal/" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    id: win

    property int lvl: 0
    property int padding: 0
    property string device: "nvidia_wmi_ec_backlight"
    property string dspLvl: (lvl / 255).toFixed(2)
    property string path: "/sys/class/backlight/nvidia_wmi_ec_backlight/brightness"

    //    Layout.fillWidth: true
    Layout.fillHeight: true
    implicitWidth: text.implicitWidth + padding

    // look at that one file that says stuff about bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbrightness uwu
    FileView {
        path: win.path
        watchChanges: true
        onFileChanged: this.reload()
        onLoaded: win.lvl = parseInt(text())
    }

    Wi.Widget {
        id: text

        icon.text: "BRT"
        icon.color: D.Colors.surface
        text.text: win.dspLvl
        text.color: D.Colors.fg
    }

}
