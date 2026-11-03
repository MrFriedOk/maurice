import "../../data" as D
import QtQuick
import Quickshell

Rectangle {
    id: root
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
}
