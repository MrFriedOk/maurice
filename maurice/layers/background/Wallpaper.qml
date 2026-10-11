import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import "../../data" as D

PanelWindow{
    required property var modelData
	screen: modelData

    WlrLayershell.layer: WlrLayer.Background

    //if you wanted to ignore the bar
    exclusionMode: ExclusionMode.Ignore
        
    anchors{
        top: true
        bottom: true
        left: true
        right:true
    }
    color: D.Colors.bg

        Item{
            anchors.fill: parent

            ClippingRectangle{
                anchors.fill:parent

                //top margin for image, let PanelWindow define bg color for bar
                anchors.topMargin: 18
                anchors.margins: 1

                radius: 10

                Image {
                    anchors.fill:parent
                    source: "./current.jpeg"

                    fillMode: Image.Stretch
                }
            }
        }
    }