import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    property string time: Qt.formatDate(clock.date, "MM/dd/yy")

    implicitHeight: text.height
    implicitWidth: text.width

    Text {
        id: text

        text: time
        color: D.Colors.fg

        font {
            bold: D.General.bold
            family: D.General.family
            pointSize: D.General.size
        }

    }

    SystemClock {
        id: clock

        precision: SystemClock.Hours
    }

}
