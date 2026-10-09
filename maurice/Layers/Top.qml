//imports
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "../Bar/Containers" as C
import "../Data" as D


Scope {
    Variants {
        //get the screens
        model: Quickshell.screens

        //'decorationless window', the actul bar
        delegate: WlrLayershell {
            id: layerShell

            required property ShellScreen modelData

            //anchors for bar
            anchors.left: true
            anchors.right: true
            anchors.bottom: true
            color: rgb(255,255,0)
            exclusionMode: ExclusionMode.Auto
            focusable: false
            //bar height
            implicitHeight: 40
            //top layer
            layer: WlrLayer.Top
            //for use from stuff like hyprland 
            namespace: "bar.bottom"
            screen: modelData
            surfaceFormat.opaque: false

            mask: Region {
                item: base
            }

            Item {
                id: base

                anchors.fill: parent
                anchors.margins: 4

                RowLayout {
                    anchors.fill: parent
                    
                    //left containers
                    C.Left {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    //middle containers
                    C.Middle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    //right containers
                    C.Right {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}