import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."
import "../../data" as D

Scope {
    id: scope
    property var notif: null
    property var notifs: server.trackedNotifications

    Timer {
        id: clock
        interval: 750
        onTriggered: server.trackedNotifications.expire() //notifCont.visible = false
    }

    NotificationServer {
        id: server

        actionsSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        //track a notif
        onNotification: {
                n => n.tracked = true;
            clock.start();
            scope.notif = n;
        }
    }
    PanelWindow {
        id: root
        property var notif: scope.notif
        property bool stay: true
        property bool hasImage: (notif.appIcon || notif.image)
        visible: notif.tracked && stay

        anchors {
            top: true
            right: true
        }
        width: hasImage ? height * 3 : height * 2
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
                id: imageCont
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }
                width: root.hasImage ? parent.width * 1 / 3 : 0
            }
            Rectangle {
                id: infoCont
                radius: parent.radius
                color: D.Colors.bg
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                    margins: 5
                }
                //width: root.hasImage ? parent.width * 2 / 3 : parent.width
                width: root.hasImage ? imageCont.width * 2 : parent.width - anchors.margins * 2
                Text {
                    anchors {
                        fill: parent
                    }
                    color: D.Colors.fg
                    font {
                        family: D.General.family
                        pointSize: 10
                    }

                    text: root.notifs
                }
            }
        }
    }
}
