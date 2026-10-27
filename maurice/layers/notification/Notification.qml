import "../../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

Scope {
    id: root

    property var notifications: server.trackedNotifications
    property bool hasSum: false
    property string notifImage: notifications.image
    property string notifInfo: "this is a notification"

    NotificationServer {
        id: server

        keepOnReload: true
        onNotification: (notif) => {
            notif.tracked = true;
        }
    }

    Timer {
        interval: 1500
        running: true
        onTriggered: {
            root.notifications.expire();
        }
    }

    PanelWindow {
        id: win

        visible: false //root.notifications
        exclusionMode: ExclusionMode.Ignore
        implicitWidth: 400
        height: 100 //notifs.contentHeight
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            enabled: true
            onClicked: root.notifications.dismiss()
        }

        anchors {
            top: true
        }

        margins {
            top: 10
        }

        Rectangle {
            anchors.fill: parent
            radius: 15
            color: D.Colors.surface

            Rectangle {
                id: info

                color: D.Colors.fg
                Layout.fillHeight: true
                width: (win.width - sum.width) - 15
                radius: parent.radius

                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }

                Text {
                    text: root.notifInfo
                    anchors.fill: parent
                    anchors.margins: 8
                    color: D.Colors.surface
                }

            }

            Rectangle {
                id: sum

                color: "red"
                width: (win.width / 4) - 3 //square cuz idk
                Layout.fillHeight: true
                radius: parent.radius

                Image {
                    cache: false
                    anchors.fill: parent
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    source: root.notifImage
                }

                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }

            }

        }

    }

}
