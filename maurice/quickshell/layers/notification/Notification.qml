import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."
import "../../data" as D

Scope {
    id: root
    function massDismiss() {
        //len = ns.length;
        const list = server.trackedNotifications.values;
        for (let i = list.length - 1; i >= 0; i--)
            list[i].dismiss();
    }
    property var notif: null //notifs.tracked
    property var notifs: server.trackedNotifications //NotificationService.notifications
    property bool hasImage: (notif.appIcon || notif.image)
    property bool open: notif//false
    property real centerProg: D.General.notificationsLauncher ? 1 : 0
    property real prog: open ? 1 : 0
    Behavior on prog {
        NumberAnimation {
            duration: D.General.animDur
            easing: Easing.InOutQuad
        }
    }
    Behavior on centerProg {
        NumberAnimation {
            duration: D.General.animDur - 40
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
        active: root.centerProg > 0 //D.General.notificationsLauncher
        PanelWindow {
            implicitWidth: 400// * root.centerProg
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
                implicitWidth: parent.width * root.centerProg
                Rectangle {
                    anchors {
                        fill: parent
                        margins: 5
                    }
                    color: D.Colors.surface
                    radius: parent.radius
                }
                Rectangle {
                    //close launcher buttom
                    Rectangle {
                        width: parent.height
                        anchors {
                            top: parent.top
                            left: parent.left
                            bottom: parent.bottom
                            margins: 5
                        }
                        radius: parent.radius
                        color: closeArea.containsMouse ? D.Colors.widget : D.Colors.surface
                        Text {
                            anchors {
                                fill: parent
                            }
                            color: D.Colors.fg
                            font {
                                family: D.General.family
                                pointSize: 16
                            }
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            text: "x"
                        }
                        MouseArea {
                            id: closeArea
                            hoverEnabled: true
                            anchors {
                                fill: parent
                            }
                            onClicked: D.General.notificationsLauncher = false
                        }
                    }
                    color: D.Colors.bg
                    height: 50
                    width: 200
                    radius: D.General.radius
                    anchors {
                        margins: 10
                        top: parent.top
                        left: parent.left
                        right: parent.right
                    }
                    Rectangle {

                        //dismiss button container
                        radius: parent.radius
                        anchors {
                            fill: parent
                            margins: 5
                            leftMargin: 60
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

                            onClicked: root.massDismiss()
                            hoverEnabled: true
                        }
                        color: btnArea.containsMouse ? D.Colors.widget : D.Colors.surface
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
                color: D.Colors.widget
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
                        id: notifsDelegate
                        MouseArea {
                            id: area
                            anchors {
                                fill: parent
                            }
                            hoverEnabled: true
                            onClicked: notifsDelegate.modelData.dismiss()
                        }
                        required property var modelData
                        radius: D.General.radius
                        color: area.containsMouse ? D.Colors.widget : D.Colors.bg
                        Behavior on color {
                            ColorAnimation {
                                duration: D.General.animDur
                            }
                        }
                        anchors {
                            left: parent.left
                            right: parent.right
                        }
                        Column {
                            spacing: 6
                            anchors {
                                topMargin: 10

                                fill: parent
                            }
                            Text {
                                //app name text
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                    topMargin: 10
                                    bottomMargin: 10
                                }
                                font {
                                    family: D.General.family
                                    pointSize: 10
                                }
                                horizontalAlignment: Text.AlignHCenter
                                text: notifsDelegate.modelData.appName
                                color: D.Colors.fg
                            }
                            Text {
                                //body text
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                }
                                font {
                                    family: D.General.family
                                    pointSize: 9
                                }
                                horizontalAlignment: Text.AlignHCenter
                                text: notifsDelegate.modelData.body
                                color: D.Colors.fg
                            }
                            Text {
                                //summary text
                                anchors {
                                    left: parent.left
                                    right: parent.right
                                }
                                font {
                                    family: D.General.family
                                    pointSize: 8
                                }
                                horizontalAlignment: Text.AlignHCenter
                                text: notifsDelegate.modelData.summary
                                color: D.Colors.fg
                            }
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
