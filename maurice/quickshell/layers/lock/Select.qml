import QtQuick
import Quickshell
import QtQuick.Layouts
import QtQuick.Controls
import "../../data" as D

Rectangle {
    id: root
    color: D.Colors.surface//D.Colors.widget
    anchors {
        right: parent.right
        bottom: parent.bottom
        bottomMargin: 5
        rightMargin: 5
    }
    height: 50
    width: 150
    ListView {
        id: list
        //spacing: anchors.margins
        property list<color> activeCol: D.Colors.activeCol
        readonly property var colorLists: D.Colors.colorLists
        anchors {
            fill: parent
            margins: 2
        }
        clip: true
        ScrollBar.vertical: ScrollBar {}
        model: colorLists
        delegate: Rectangle {
            color: area.containsMouse ? D.Colors.surface : D.Colors.widget
            Behavior on color {
                ColorAnimation {
                    duration: D.General.animDur
                }
            }
            anchors {
                left: parent.left
                right: parent.right
            }
            height: root.height / 2
            Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors {
                    fill: parent
                }
                text: modelData.text
                color: D.Colors.fg
                font {
                    family: D.General.family
                    pointSize: 8
                }
            }
            MouseArea {
                id: area
                hoverEnabled: true
                anchors {
                    fill: parent
                }
                onClicked: D.Colors.activeCol = modelData.list
            }
        }
    }
}
