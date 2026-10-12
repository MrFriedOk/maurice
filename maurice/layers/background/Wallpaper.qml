import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets
import Quickshell.Io
import "../../data" as D

PanelWindow{
    id: win
    required property var modelData
    property string image: "../../data/current.png"
	screen: modelData

    WlrLayershell.layer: WlrLayer.Background

    //if you wanted the wallpaper to ignore the bar
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
                anchors{
                    fill:parent

                    //top margin for image, let PanelWindow define bg color for bar
                    topMargin: 26
                    margins: 1
                }

                radius: 10

                Image {
                    anchors.fill:parent
                    source: win.image

                    fillMode: Image.Stretch
                }
            }
        }
}
