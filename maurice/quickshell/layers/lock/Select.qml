import QtQuick
import Quickshell
import QtQuick.Layouts
import QtQuick.Controls
import "../../data" as D

Rectangle {
    color: D.Colors.surface//D.Colors.widget
    anchors {
        right: parent.right
        bottom: parent.bottom
        bottomMargin: 5
        rightMargin: 5
    }
    height: 50
    width: 200
    ListView {
        //spacing: anchors.margins
        property list<color> activeCol: D.Colors.activeCol
        readonly property var colorLists: D.Colors.colorLists
        anchors {
            fill: parent
            margins: 2
        }
        height: 200
        width: 400
        clip: true
        ScrollBar.vertical: ScrollBar {}
        model: colorLists
        delegate: Rectangle {
            color: area.containsMouse ? D.Colors.surface : D.Colors.widget
            anchors {
                left: parent.left
                right: parent.right
            }
            height: 30
            Text {
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors {
                    fill: parent
                }
                text: 'hi'
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
            }
        }
    }
}
