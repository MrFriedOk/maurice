import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland

Item{
    id: item

    property string icon: ""
    property string text: ""

    default property alias content: part.data

    RowLayout{
        id: part

        Text{text: "hi"}
    }

}