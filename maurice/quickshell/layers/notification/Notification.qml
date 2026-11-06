import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."
import "../../data" as D

PanelWindow {
    id: root
    MouseArea {
        anchors {
            fill: parent
        }
        onClicked: root.notif = null
    }
    property var notif: null //notifs.tracked
    property var notifs: server.trackedNotifications //NotificationService.notifications
    property bool hasImage: (notif.appIcon || notif.image)
    //visible: notif

    Timer {
        id: clock
        interval: 2000
        onTriggered: root.notif = null
    }

    NotificationServer {
        id: server
        actionsSupported: true
        imageSupported: true

        onNotification: n => {
            n.tracked = true;
            root.notif = n;
            console.log(n.summary);
            clock.restart();
        }
    }

    anchors {
        top: true
        right: true
    }
    width: hasImage ? height * 3 : height * 2
    color: "transparent"//D.Colors.widget
    height: 125
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
        Image {
            id: imageCont
            source: root.notif.image
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
            width: root.hasImage ? imageCont.width * 2 - anchors.margins * 3 : parent.width - anchors.margins * 2
            Row {
                anchors {
                    fill: parent
                }
                spacing: 10

                Text {
                    id: sender
                    width: parent.width
                    text: root.notif.appName
                    horizontalAlignment: Text.AlignHCenter
                    anchors {
                        fill: parent
                        margins: 5
                    }

                    color: D.Colors.fg
                    font {
                        family: D.General.family
                        pointSize: 10
                    }
                }
                Text {
                    font {
                        family: D.General.family
                        pointSize: 9
                    }
                }
            }
        }
    }
}
