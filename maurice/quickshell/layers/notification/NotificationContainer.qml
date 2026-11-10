import Quickshell
import QtQuick
import "../../data" as D

PanelWindow {
    id: notifCont
    color: "transparent"
    anchors {
        top: true
        right: true
    }
    margins {
        top: 10
        right: 10
    }
    width: 300
    height: 100
    exclusionMode: ExclusionMode.Ignore
    ListView {
        anchors {
            fill: parent
        }
        model: server.trackedNotifications
        spacing: 4
        delegate: Rectangle {
            id: root
            radius: D.General.radius
            height: 100
            anchors {
                left: parent.left
                right: parent.right
            }
            required property var modelData
            color: D.Colors.widget
            MouseArea {
                anchors {
                    fill: parent
                }
                onClicked: root.modelData.tracked = false
            }
        }
    }
}
