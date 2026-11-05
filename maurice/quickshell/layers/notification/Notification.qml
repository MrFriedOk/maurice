import QtQuick
import Quickshell
import Quickshell.Services.Notifications
import "."

Scope {
    id: root

    NotificationServer {
        id: server

        keepOnReload: true
        actionsSupported: true
        bodyMarkupSupported: true
        imageSupported: true

        //track a notif
        onNotification: n => n.tracked = true
    }

    ListView {
        model: server.trackedNotifications
        spacing: 4
        delegate: NotificationContainer {}
    }
}
