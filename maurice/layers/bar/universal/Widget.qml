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
    property alias icon: icon
    property alias text: text
    property string font: "Atkinson Hyperlegible"
    property bool hasBg: D.General.widRect

    implicitWidth: item.implicitWidth
    //Layout.fillHeight: true
    height: D.General.barHeight
    color: hasBg ? D.Colors.widget : "transparent"
    radius: D.General.radius

    anchors {
        //fill: parent
        //top: parent.top
        //bottom: parent.bottom
        //margins: 5

        fill: parent
    }

    RowLayout {
        //height: D.General.barHeight / 2

        id: item

        //width: text.width + icon.width
        spacing: D.General.txtSpacing

        anchors {
            centerIn: parent
        }

        Text {
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

            Layout.alignment: Qt.AlignRight

            font {
                family: D.General.family
                bold: D.General.bold
                pointSize: D.General.size
            }

        }

    }

}
