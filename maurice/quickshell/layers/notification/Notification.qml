import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."
import "../../data" as D

PanelWindow {
    id: root
    property var notif: D.General.notif
    property bool stay: true
    visible: notif.tracked && stay

    anchors {
        top: true
        right: true
    }
    width: (notif.appIcon || notif.image || notif.hasActionIcons) ? height * 3 : height * 2
    color: "transparent"//D.Colors.widget
    exclusionMode: ExclusionMode.Ignore
    margins {
        top: D.General.barHeight * 2
        right: D.General.barHeight
    }
    Rectangle {
        anchors {
            fill: parent
        }
        radius: D.General.radius
        color: D.Colors.widget
        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                margins: 5
            }
        }
    }
}
