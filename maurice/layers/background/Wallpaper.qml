import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets

PanelWindow {
    id: win

    required property var modelData
    property string image: "../../data/current.png"

    screen: modelData
    WlrLayershell.layer: WlrLayer.Background
    //if you wanted the wallpaper to ignore the bar
    exclusionMode: ExclusionMode.Ignore
    color: D.Colors.bg

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Item {
        anchors.fill: parent

        ClippingRectangle {
            radius: 10

            anchors {
                fill: parent
                //top margin for image, let PanelWindow define bg color for bar
                topMargin: D.General.barHeight + 1
                margins: 1
            }

            Image {
                anchors.fill: parent
                source: win.image
                fillMode: Image.Stretch
            }

        }

    }

}
