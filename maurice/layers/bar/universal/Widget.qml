import "../../../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Wayland

Rectangle {
    //implicitWidth: item.width
    //implicitHeight: item.implicitHeight
    //    Layout.fillHeight: true
    //  Layout.fillWidth: true

    id: root

    property int wid: text.implicitWidth + icon.implicitWidth
    property int h: text.implicitHeight + icon.implicitHeight
    property bool hasIcon: icon.text.trim().length > 0
    property int padding: 15
    property alias icon: icon
    property alias text: text
    property string font: "Atkinson Hyperlegible"
    property bool hasBg: D.General.widRect

    implicitWidth: 75 + padding
    //Layout.fillHeight: true
    color: hasBg ? D.Colors.widget : "transparent"
    radius: D.General.radius

    anchors {
        //fill: parent
        //top: parent.top
        //bottom: parent.bottom

        fill: parent
        margins: 5
    }

    RowLayout {
        //implicitWidth: text.implicitWidth + icon.implicitWidth

        id: item

        spacing: text.anchors.leftMargin + root.padding

        Text {
            //anchors {
            //    leftMargin: 5
            //    left: parent.left
            //}

            id: icon

            visible: hasIcon

            font {
                bold: D.General.bold
                family: D.General.family
                pointSize: D.General.size
            }

        }

        Text {
            //horizontalAlignment: Text.AlignHCenter

            id: text

            anchors {
                right: parent.right
                //rightMargin: 5
                leftMargin: 5
                verticalCenter: parent.verticalCenter
            }

            font {
                family: D.General.family
                bold: D.General.bold
                pointSize: D.General.size
            }

        }

    }

}
