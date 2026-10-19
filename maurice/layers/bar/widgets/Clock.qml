import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io

Item {
    //anchors.fill: parent
    // MouseArea {
    // hoverEnabled: true
    //   anchors.fill: parent
    // onHoveredChanged: root.showDate = !root.showDate
    // }
    //Layout.fillHeight: true

    id: root

    property string time: Qt.formatDateTime(clock.date, "hh:mm")
    property int padding: 0
    property bool showDate: false

    //    implicitWidth: showDate ? winTime.width + padding : winTime.implicitWidth + padding
    //implicitWidth: text.width
    //width: text.width
    implicitHeight: 25

    anchors {
        //horizontalCenter: parent.horizontalCenter

        //top: parent.top
        //bottom: parent.bottom
        fill: parent
    }

    Rectangle {
        color: "green"
        width: 25
        height: 25
        anchors.fill: parent
    }

    Wi.Scramble {
        id: text

        target: root.time
        color: D.Colors.fg

        anchors {
            fill: parent
        }

    }

    SystemClock {
        id: clock

        enabled: true
        precision: SystemClock.Minutes
    }

}
