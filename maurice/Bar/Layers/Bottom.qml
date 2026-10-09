import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "../Containers" as C
import "../../Data" as D

Scope {
    Variants {
        model: Quickshell.screens

        delegate: WlrLayershell {
            id: layerShell

            required property ShellScreen modelData

            anchors.left: true
            anchors.right: true
            anchors.bottom: true
            // use colors from a pre-generated matugen palette
            color: D.Colors.withAlpha(D.Colors.md3.background, 1)
            exclusionMode: ExclusionMode.Auto
            focusable: false
            implicitHeight: 40
            layer: WlrLayer.Top
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

                    C.Left {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    C.Middle {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }

                    C.Right {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                    }
                }
            }
        }
    }
}