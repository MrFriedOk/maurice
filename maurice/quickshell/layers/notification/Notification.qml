import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."

Scope {
    id: root

    Timer {
        id: clock
        interval: 750
        onTriggered: server.trackedNotifications.expire() //notifCont.visible = false
    }

    NotificationServer {
        id: server

        keepOnReload: true
        actionsSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        //track a notif
        onNotification: {
                n => n.tracked = true;
            clock.start();
        }
    }

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
            delegate: NotificationContainer {}
        }
    }
}
