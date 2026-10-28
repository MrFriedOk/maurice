import "../../../data" as D
import "../universal" as Wi
import "../widgets" as W
import "../widgets/audio" as Au
import QtQuick
import QtQuick.Layouts
import Quickshell

//widgets row
RowLayout {
    //LayoutMirroring.enabled: Qt.application.layoutDirection === Qt.RightToLeft
    // layoutDirection: Qt.RightToLeft
    spacing: D.General.spacing

    Wi.Divider {
    }

    W.Clock {
    }

    Wi.Divider {
    }

    W.Date {
    }

    Wi.Divider {
    }

    anchors {
        //        margins: 2
        top: parent.top
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }

}
