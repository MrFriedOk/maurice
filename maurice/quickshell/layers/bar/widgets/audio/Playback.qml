import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Rectangle {
    id: root

    //omg my naming is actually so good
    property bool trans: !D.General.widRect
    property int expand: 250
    property bool open: false
    property bool hovered: false

    radius: D.General.radius
    width: 200
    color: trans ? "transparent" : D.Colors.widget
    height: D.General.barHeight

    anchors {}

    Rectangle {
        height: 20
        visible: false

        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
    }

    MouseArea {
        hoverEnabled: true
        onHoveredChanged: root.hovered = !root.hovered
        onClicked: root.open = !root.open

        anchors {
            fill: parent
        }
    }

    Item {
        visible: !D.General.vizEnabled

        anchors {
            fill: parent
        }

        Wi.Scramble {
            property int max: parent.width

            horizontalAlignment: Text.AlignHCenter
            width: max - 20
            elide: Text.ElideRight
            color: D.Colors.fg
            target: D.General.player.trackTitle

            anchors {
                centerIn: parent
            }

            font {
                family: D.General.family
                pointSize: parent.width / 20 //D.General.size
            }
        }
    }

    Viz {
        anchors {
            right: parent.right
            left: parent.left
            verticalCenter: parent.verticalCenter
        }
    }

    Popup {
        //handle this here otherwise it breaks lol
        visible: root.open
        width: root.width + expand

        anchor {
            item: root
        }
    }
}
