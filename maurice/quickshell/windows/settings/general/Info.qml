import "../../../data" as D
import QtQuick
import Quickshell

Rectangle {
    id: root
    function run() {
        if (!tooltipOpen && area.containsMouse)
            on.running = true;
        else
            off.running = true;
    }
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
        id: on
        running: area.containsMouse && !root.tooltipOpen //false //root.run() //area.containsMouse
        interval: 750
        onTriggered: root.tooltipOpen = true
    }
    Timer {
        id: off
        running: !area.containsMouse && root.tooltipOpen//false //root.run() //area.hoveredChanged && root.tooltipOpen === true
        interval: 250
        onTriggered: root.tooltipOpen = false
    }
    MouseArea {
        id: area
        //onHoveredChanged: root.run()
        anchors {
            fill: parent
        }
        hoverEnabled: true
    }
    Rectangle {
        color: D.Colors.widget
        x: 200

        radius: D.General.radius
        //visible: root.tooltipOpen
        opacity: root.tooltipOpen ? .7 : 0
        Behavior on opacity {
            NumberAnimation {
                duration: 120
                easing: Easing.InOutQuad
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
            color: D.Colors.accent
        }
    }
}
