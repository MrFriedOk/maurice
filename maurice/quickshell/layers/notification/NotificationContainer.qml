import Quickshell
import QtQuick
import "../../data" as D

PanelWindow {
    required property var modelData
    anchors {
        top: true
    }
    width: 400
    height: 200
    color: D.General.widget
}
