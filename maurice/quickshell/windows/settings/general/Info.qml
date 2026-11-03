import "../../../data" as D
import QtQuick
import Quickshell

Rectangle {
    id: root
    property bool tooltipOpen: false
    property string tooltip: ""
    property string hint: ""
    width: content.implicitWidth + content.anchors.margins * 2 //50
    radius: D.General.radius
    color: D.Colors.widget
    height: parent.height //- root.spacing
    Text {
        id: content
        anchors {
            fill: parent
            margins: 5
        }
        font {
            family: D.General.family
            pointSize: 10
        }
        verticalAlignment: Text.AlignHCenter
        text: root.hint //row.modelData.name
        color: D.Colors.fg
    }
    Timer {
        running: area.containsMouse
        interval: 750
        onTriggered: root.tooltipOpen = true
    }
    MouseArea {
        id: area
        anchors {
            fill: parent
        }
        hoverEnabled: true
    }
    Rectangle {
        //visible: root.tooltipOpen
        opacity: root.tooltipOpen ? .7 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 120
                easing: Easing.InCirc
            }
        }
        height: ttpContent.implicitHeight
        width: ttpContent.implicitWidth
        Text {
            id: ttpContent
            text: root.tooltip
            font {
                family: D.General.family
                pointSize: 8
            }
            color: D.Colors.widget
        }
    }
}
