import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland
import "../../../data" as D

RowLayout{
    id: item

    property alias icon: icon
    property alias text: text
    property string font: "SpaceMono Nerd Font"


    anchors{
        centerIn: parent
    }
    
    Item{
        width: icon.width
        Text { 
            id: icon

            color: D.Colors.surface
            font: item.font 
        }
    }

    Item{
        Text { 
            id: text

            color: D.Colors.surface
            font: item.font 
        }
    }
}   

