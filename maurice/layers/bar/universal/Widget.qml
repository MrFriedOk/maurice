import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland
import "../../../data" as D

Item{
    id: item
    anchors.fill: parent

    property string icon: ""
    property string text: ""

    Rectangle{
        anchors.fill:parent
        color: D.Colors.fg
        RowLayout{
            id: part

            Text{
                text: "hi"
                color: D.Colors.fg
            }
        }
    }
}