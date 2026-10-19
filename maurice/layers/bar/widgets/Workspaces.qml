import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Rectangle {
    id: win

    property int padding: 2
		property var workspaces: Hyprland.workspaces
		      property int focused: Hyprland.focusedWorkspace?.id ?? 0

    color: D.Colors.widget
    Layout.fillHeight: true
    implicitWidth: row.implicitWidth + padding
    radius: D.General.radius

   // anchors {
   //     left: parent.left
    //}

    Row {
        id: row

        spacing: 1

        anchors {
            //centerIn: parent

        }

				Repeater {
            id: rep

						model: win.workspaces

            delegate: Rectangle {
                id: wkspc

                required property int index
                property bool hovered: false

                radius: win.radius
                color: {
                    if (hovered)
										return D.Colors.bg;
										if (focused === index + 1)
										return D.Colors.fg
										else
										return D.Colors.surface

                }
                width: 15
                height: 15

								MouseArea {
									enabled: true
                    anchors.fill: parent
                    onHoveredChanged: wkspc.hovered = !wkspc.hovered
                    hoverEnabled: true
                    onClicked: Hyprland.dispatch("notify-send hi")//Hyprland.dispatch("hl.dsp.focus({workspace = ${wkspc.index + 1} })")
                }

                Text {
                    text: wkspc.index + 1
                    color: D.Colors.fg

                    anchors {
                        fill: parent
                        centerIn: parent
                    }

                }

                Behavior on color {
                    ColorAnimation {
                        duration: 80
                    }

                }

            }

        }

    }

    Behavior on implicitWidth {
        NumberAnimation {
            duration: 80
            easing.type: Easing.InOutCirc
        }

    }

}
