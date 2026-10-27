import "../../../data" as D
import QtQuick
import Quickshell

Item {
    id: root

    property string text: ""
    property string color: ""
    property int maxWidth: 200
    property int contentWidth: label.contentWidth
    property real speed: 40 // pixels per second
    readonly property real overflow: Math.max(0, label.implicitWidth - width)

    function restart() {
        scroll.stop();
        label.x = 0;
        if (overflow > 0)
            scroll.start();

    }

    implicitWidth: Math.min(label.implicitWidth, maxWidth)
    implicitHeight: label.implicitHeight
    clip: true // hides the part of the text outside the box
    onOverflowChanged: restart()
    onTextChanged: restart()
    Component.onCompleted: restart()

    // no x anchors: the animation owns x
    Text {
        id: label

        color: D.Colors.fg
        text: root.text

        font {
            pointSize: 14
            family: D.General.family
        }

    }

    SequentialAnimation {
        id: scroll

        loops: Animation.Infinite

        PauseAnimation {
            duration: 1500
        }

        NumberAnimation {
            target: label
            property: "x"
            to: -root.overflow
            duration: root.overflow / root.speed * 1000
            easing.type: Easing.Linear
        }

        PauseAnimation {
            duration: 1500
        }

        NumberAnimation {
            target: label
            property: "x"
            to: 0
            duration: root.overflow / root.speed * 1000
            easing.type: Easing.Linear
        }

    }

}
