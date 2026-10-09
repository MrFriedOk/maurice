// below the bottom, where........ backgrounds go

//imports
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Scope{
    Variants{
        model: Quickshell.screens

        delegate: WlrLayershell {
            id: layerShell

            required property ShellScreen modelData

            anchors.left: true
            anchors.right: true
            anchors.top: true
            anchors.bottom: true
            color: rgb(255,255,0)
            focusable: false
            layer: WlrLayer.Bottom
            screen: modelData

            mask: Region {
                item: base
            }
        }
        
        Item {
            id: base

            anchors.fill: parent
            anchors.margins: 4
        }
    }
}