import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import "../universal" as Wi
import "../../../data" as D


Rectangle{
    id: root

    color: D.Colors.fg
    
    Wi.Widget{
        id: win

        text{
            text: Qt.formatDateTime(clock.date, "hh:mm:ss")
            color: D.Colors.fg
        }
    }
    SystemClock {
        id: clock

        enabled: true
        precision: SystemClock.Seconds
    }
}