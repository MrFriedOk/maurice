import "../../../data" as D
import "../universal" as Wi
import "../widgets" as W
import "../widgets/audio" as Au
import "../widgets/networking" as Net
import QtQuick
import QtQuick.Layouts
import Quickshell

//iterate across widgets
RowLayout {
    spacing: D.General.spacing
    //implicitWidth: 100
    //    implicitHeight: text.height
    layoutDirection: Qt.LeftToRight

    anchors {
        // top: parent.top
        // bottom: parent.bottom
        //horizontalCenter: parent.horizontalCenter
        //verticalCenter: parent.verticalCenter

        left: parent.left
        margins: 1
        //leftMargin: 10
        top: parent.top
        bottom: parent.bottom
    }

    W.Workspaces {
    }

    Wi.Divider {
    }

    W.Workspace {
    }

    Wi.Divider {
    }

    Net.Bt {
    }

    Wi.Divider {
    }

    Net.Internet {
    }

    Wi.Divider {
    }

    Au.Playback {
    }

    Wi.Divider {
    }

}
