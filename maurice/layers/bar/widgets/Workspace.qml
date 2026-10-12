import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import "../../../data" as D
import "../universal" as Wi

Rectangle{
    id: win

    readonly property string wkspc: activeWindow?.activated ? activeWindow?.appId : "desktop"
    readonly property Toplevel activeWindow: ToplevelManager.activeToplevel

    color: D.Colors.bg

    Wi.Widget{
        text.text: win.wkspc
        text.color: D.Colors.fg
    }
}