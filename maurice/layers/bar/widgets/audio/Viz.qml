import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import Quickshell

Rectangle {
    color: D.Colors.widget
    width: 100
    height: parent.height

    Wi.Widget {
        text.text: "hi"
    }

}
