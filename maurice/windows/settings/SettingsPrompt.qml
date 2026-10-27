import "../data" as D
import QtQuick
import Quickshell
import Quickshell.Wayland

PanelWindow {
    //color: hoverH.hovered ? "green" : "red"
    color: "white"
    //"transparent"
    implicitWidth: 1
    exclusionMode: ExclusionMode.Ignore
    WlrLayershell.layer: WlrLayer.Top

    anchors {
        top: true
        bottom: true
        right: true
    }

    HoverHandler {
        //property bool hovered: false

        id: hoverH

        onHoveredChanged: {
            //hovered = !hovered;
            if (hovered)
                return buffer.running = true;
            else
                return buffer.running = false;
        }
    }

    Timer {
        id: buffer

        interval: 250
        onTriggered: D.General.settings = true
    }

}
