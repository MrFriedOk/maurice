pragma Singleton
import "."
import Quickshell
import QtQuick
import Quickshell.Services.Notifications

Singleton {
    id: root
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
            root.notif = n;
        }
    }
}
