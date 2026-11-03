import Quickshell
import QtQuick
import "../../data" as D

Rectangle {
    //switch container
    id: root
    property bool assigned: false

    signal toggled(bool assigned)

    radius: height / 2
    height: 30
    width: height * 2
    color: D.Colors.surface
    Rectangle {
        //switch i/o
        Rectangle {
            color: D.Colors.surface
            height: parent.height
            width: height
            radius: height / 2
            x: root.assigned ? (parent.width - width) - 1 : 1
            Behavior on x {
                NumberAnimation {
                    duration: 120
                }
            }
            //surely there's a better way to do this
            anchors {
                //left: !root.assigned ? parent.left : false
                //right: root.assigned ? parent.right : false
                top: parent.top
                bottom: parent.bottom
                margins: 1
            }
        }
        radius: parent.radius
        anchors {
            fill: parent
            margins: 2
        }
        color: root.assigned ? D.Colors.fg : D.Colors.widget
        Behavior on color {
            ColorAnimation {
                duration: 80
            }
        }
        MouseArea {
            anchors {
                fill: parent
            }
            onClicked: root.toggled(!root.assigned)//root.assigned = !root.assigned
        }
    }
}
