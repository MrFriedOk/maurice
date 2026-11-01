import QtQuick
import Quickshell
import QtQuick.Layouts
import "../../data" as D

Flickable {
    id: root
    clip: true
    property list<color> activeCol: D.Colors.activeCol
    readonly property var colorLists: D.Colors.colorLists
    anchors {
        bottom: parent.bottom
        right: parent.right
    }
    height: 200
    width: 300
    contentWidth: content.width
    contentHeight: content.height
    Column {
        id: content
        anchors {
            fill: parent
        }
        Repeater {
            model: root.activeCol
            delegate: Rectangle {
                anchors {
                    left: parent.left
                    right: parent.right
                }
                height: 50
            }
        }
    }
}
