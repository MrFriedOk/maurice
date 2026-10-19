import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland

Rectangle {
    required property LockBack back

    anchors.fill: parent

    Button {
        text: "hi"
        onClicked: back.unlocked()
    }

}
