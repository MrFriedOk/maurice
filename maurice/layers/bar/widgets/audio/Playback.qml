import "../../../../data" as D
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    id: root

    //omg my naming is actually so good
    property bool trans: !D.General.widRect

    width: 200
    color: trans ? "transparent" : D.Colors.widget
    height: D.General.barHeight

    Text {
        //height: D.General.barHeight / 2

        text: "Hi"

        anchors {
            verticalCenter: parent.verticalCenter
        }

    }

}
