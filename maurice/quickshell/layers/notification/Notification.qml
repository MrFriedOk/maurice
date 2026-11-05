import "../../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Notifications

Scope {
    id: root

    //property var notifications: server.trackedNotifications
    property bool hasSum: false
    //property string notifImage: notifications.image
    property string notifInfo: server.hi[0]//server.notif.body

    property string notifImage: server.notif.appIcon //Notification.image
    property string notifIcon: Notification.appIcon
    property string notifAppName: Notification.appName

    NotificationServer {
        id: server

        keepOnReload: true
        actionsSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        //track a notif
        onNotification: n => n.tracked = true
        //readonly property list<string> hi: [trackedNotifications.Notification.image]
        //property var notif: trackedNotifications[0]
        //onNotification: notif => {
        //	notif.tracked = true;

        //}
    }

    Timer {
        interval: 1500
        running: false//true
        onTriggered: {
            root.notifications.expire();
        }
    }

    PanelWindow {
        id: win

        visible: true//root.notifications
        exclusionMode: ExclusionMode.Ignore
        implicitWidth: 400
        height: 100 //notifs.contentHeight
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            enabled: true
            //onClicked: root.notifications.dismiss()
        }

        anchors {
            top: true
        }

        margins {
            top: 10
        }

        Rectangle {
            anchors.fill: parent
            radius: D.General.radius
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

                Repeater {
                    model: server.trackedNotifications

                    delegate: Text {
                        required property var modelData
                        text: modelData.body//modelData.id//root.notifInfo//Notification.actions.identifier//root.notifAppName//root.notifInfo
                        anchors.fill: parent
                        anchors.margins: 8
                        color: D.Colors.surface
                        font {
                            family: D.General.family
                            pointSize: 9
                        }
                    }
                }
            }

            Rectangle {
                id: sum

                color: "transparent"
                width: (win.width / 4) - 3 //square cuz idk
                Layout.fillHeight: true
                radius: parent.radius

                Repeater {
                    model: server.trackedNotifications

                    delegate: Image {
                        required property var modelData
                        cache: false
                        anchors.fill: parent
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        source: modelData.image //root.notifIcon//root.notifImage
                    }
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
