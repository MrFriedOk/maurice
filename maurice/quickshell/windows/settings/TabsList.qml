import Quickshell
import QtQuick
import "."
import "../../data" as D

ListView {
    id: root
    property string content: "General.qml"
    //property bool general: true
    //property bool visualizer: false
    property var tabs: [
        {
            name: "General"
        },
        {
            name: "Font"
        },
        {
            name: "Bar"
        },
        {
            name: "Visualizer"
        }
    ]
    anchors {
        fill: parent
        margins: 1
    }
    model: tabs
    spacing: 2
    delegate: Rectangle {
        id: delegateRt
        color: area.containsMouse ? D.Colors.surface : D.Colors.widget
        Behavior on color {
            ColorAnimation {
                duration: D.General.animDur
            }
        }
        radius: D.General.radius
        height: 50
        required property var modelData
        anchors {
            left: parent.left
            right: parent.right
        }
        Text {
            color: D.Colors.fg
            font {
                pointSize: 8
                family: D.General.family
            }
            anchors {
                left: parent.left
                leftMargin: 10
                verticalCenter: parent.verticalCenter
            }
            verticalAlignment: Text.AlignVCenter
            text: delegateRt.modelData.name
        }
        MouseArea {
            id: area
            //onClicked: 'hi'
            anchors {
                fill: parent
            }
            hoverEnabled: true
            onClicked: root.content = ("%1", delegateRt.modelData.name) + ".qml"//root[delegateRtmodelData.toggle] = root[!delegateRt.modelData.toggle]
        }
    }
}
