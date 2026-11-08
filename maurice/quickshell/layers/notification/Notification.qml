import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."
import "../../data" as D

Scope {
    id: root
    property var notif: null //notifs.tracked
    property var notifs: server.trackedNotifications //NotificationService.notifications
    property bool hasImage: (notif.appIcon || notif.image)
    property bool open: notif//false
    property real prog: open ? 1 : 0
    Behavior on prog {
        NumberAnimation {
            duration: D.General.animDur
            easing: Easing.InOutQuad
        }
    }
    Timer {
        id: clock
        interval: 4000
        onTriggered: {
            root.notif = null;
        }
    }

    NotificationServer {
        id: server
        actionsSupported: true
        imageSupported: true

        onNotification: n => {
            n.tracked = true;
            root.notif = n;
            clock.restart();
        }
    }
    LazyLoader {
        active: root.prog > 0 //|| root.open //D.General.notificationsLauncher
        PanelWindow {
            implicitWidth: 400
            anchors {
                top: true
                right: true
                bottom: true
            }
            margins {
                top: 5
                right: 5
                bottom: 5
            }
            exclusionMode: ExclusionMode.Ignore
            color: "transparent"
            //visible: D.General.notificationsLauncher
            Rectangle {
                Rectangle {
                    //dismiss button container
                    color: D.Colors.surface
                    height: 50
                    width: 200
                    radius: D.General.radius
                    anchors {
                        margins: 5
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                    Rectangle {
                        anchors {
                            fill: parent
                            margins: 3
                        }
                        Behavior on color {
                            ColorAnimation {
                                duration: D.General.animDur
                            }
                        }
                        MouseArea {
                            id: btnArea
                            anchors {
                                fill: parent
                            }
                            function massDismiss() {
                                //len = ns.length;
                                for (const n of [server.trackedNotifications.values])
                                    n.dismiss();
                            }
                            onClicked: massDismiss()
                        }
                        color: btnArea.containsMouse ? D.Colors.surface : D.Colors.widget
                        Text {
                            color: D.Colors.fg
                            anchors {
                                fill: parent
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "Clear all"
                            font {
                                family: D.General.family
                                pointSize: 12
                            }
                        }
                    }
                }
                radius: D.General.radius
                anchors {
                    fill: parent
                }
                color: D.Colors.bg
                ListView {
                    height: 200
                    spacing: 10
                    anchors {
                        topMargin: 200
                        fill: parent
                        margins: 10
                    }
                    model: root.notifs

                    delegate: Rectangle {
                        radius: D.General.radius
                        color: D.Colors.surface
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        height: 100
                    }
                }
            }
        }
    }
    LazyLoader {
        id: notifLoader
        active: root.prog > 0 || root.open //root.open
        PanelWindow {
            id: win
            MouseArea {
                anchors {
                    fill: parent
                }
                onClicked: root.notif = null
            }

            //visible: notif

            anchors {
                top: true
                right: true
            }
            implicitWidth: hasImage ? height * 3 : height * 2
            color: "transparent"//D.Colors.widget
            height: 100
            exclusionMode: ExclusionMode.Ignore
            margins {
                top: D.General.barHeight * 2
                right: D.General.barHeight
            }
            Rectangle {
                property real progress: root.open ? 1 : 0
                Behavior on progress {
                    NumberAnimation {
                        duration: D.General.animDur
                        easing: Easing.InOutQuad
                    }
                }
                opacity: progress
                scale: .95 + .05 * progress
                anchors {
                    fill: parent
                }
                radius: D.General.radius
                color: D.Colors.widget
                Image {
                    id: imageCont
                    source: {
                        if (root.notif.image)
                            return root.notif.image;
                        if (root.notif.appIcon)
                            return root.notif.appIcon;
                    }
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
                    Column {
                        anchors {
                            fill: parent
                            margins: 10
                        }
                        spacing: 9

                        Text {
                            id: sender
                            width: parent.width - 20
                            text: root.notif.appName
                            horizontalAlignment: Text.AlignHCenter
                            anchors {
                                left: parent.left
                                right: parent.right
                            }

                            color: D.Colors.fg
                            font {
                                family: D.General.family
                                pointSize: 9
                            }
                        }
                        Text {
                            id: body
                            text: root.notif.body
                            width: parent.width - 20
                            horizontalAlignment: Text.AlignHCenter
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            color: D.Colors.fg
                            font {
                                family: D.General.family
                                pointSize: 7
                            }
                        }
                        Text {
                            id: sum
                            width: parent.width - 20
                            text: root.notif.summary
                            horizontalAlignment: Text.AlignHCenter
                            anchors {
                                left: parent.left
                                right: parent.right
                            }
                            color: D.Colors.fg
                            font {
                                family: D.General.family
                                pointSize: 6
                            }
                        }
                    }
                }
            }
        }
    }
}
