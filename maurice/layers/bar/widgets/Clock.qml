import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    //width: text.width
    //anchors.fill: parent
    // MouseArea {
    // hoverEnabled: true
    //   anchors.fill: parent
    // onHoveredChanged: root.showDate = !root.showDate
    // }
    //    Layout.fillHeight: true

    id: root

    property string time: Qt.formatTime(clock.date, "hh:mm")
    property int padding: 0
    property bool showDate: false

    //    implicitWidth: showDate ? winTime.width + padding : winTime.implicitWidth + padding
    implicitWidth: text.width
    implicitHeight: text.height

    Wi.Scramble {
        id: text

        target: root.time
        color: D.Colors.fg

        font {
            pointSize: D.General.size
        }

    }

    SystemClock {
        id: clock

        enabled: true
        precision: SystemClock.Minutes
    }

}
