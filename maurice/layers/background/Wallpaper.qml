import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import Quickshell.Widgets

PanelWindow {
    id: root

    required property var modelData
    property string image: "/tmp/mpris-art.png" //"../../data/current.png"

    screen: modelData
    WlrLayershell.layer: WlrLayer.Background
    //if you wanted the wallpaper to ignore the bar
    exclusionMode: ExclusionMode.Ignore
    color: D.Colors.bg

    FileView {
        path: "/tmp/mpris-art"
        watchChanges: true
        onFileChanged: {
            root.image = "";
            root.image = "/tmp/mpris-art.png";
        }
    }

    anchors {
        top: true
        bottom: true
        left: true
        right: true
    }

    Item {
        //visible: !D.General.adaptiveWallChanged
        anchors.fill: parent

        ClippingRectangle {
            radius: 10

            anchors {
                fill: parent
                //top margin for image, let PanelWindow define bg color for bar
                topMargin: D.General.barHeight + 1
                margins: 1
            }

            Rectangle {
                //GradientStop {
                //    position: 0.5
                //    color: D.Colors.idk
                //}

                visible: !wall.visible

                anchors {
                    fill: parent
                }

                //color: D.Colors.fg
                gradient: Gradient {
                    GradientStop {
                        position: 0
                        color: D.Colors.fg
                    }

                    GradientStop {
                        position: 1
                        color: D.Colors.accent
                    }

                }

            }

            Image {
                id: wall

                visible: !D.General.adaptiveWall
                cache: false
                asynchronous: true
                anchors.fill: parent
                source: root.image
                fillMode: Image.Stretch
            }

        }

    }

}
