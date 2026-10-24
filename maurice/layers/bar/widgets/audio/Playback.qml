import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    //}
    //}
    //function posChanged() {
    //    text.text = root.pos;
    //}
    //Image {
    //    source: root.art
    //  anchors {
    //       centerIn: parent
    //   }
    //}
    //learning stuff and waste of space
    //Row {
    //  anchors {
    //    centerIn: parent
    //}
    //Repeater {
    //  model: root.stuff
    //delegate: Text {
    //  id: text
    //required property var modelData
    //text: modelData
    //Timer {
    //    interval: 1000
    //    running: true
    //    repeat: true
    //   onTriggered: root.player.posChanged
    //}
    //property ObjectModel players: Mpris.players
    //}

    id: root

    //omg my naming is actually so good
    property bool trans: !D.General.widRect
    property bool open: false
    property bool hovered: false

    width: 200
    color: trans ? "transparent" : D.Colors.widget
    height: D.General.barHeight

    Text {
        //height: D.General.barHeight / 2
        //text: txt.arg(root.pos,root.len)
        //text: root.remain

        id: text

        property string txt: "%1 : %2"

        anchors {
            verticalCenter: parent.verticalCenter
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

    Popup {
        visible: root.open
    }

}
