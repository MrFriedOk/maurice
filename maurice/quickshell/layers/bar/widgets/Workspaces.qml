import "../../../data" as D
import "../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland

Rectangle {

    id: win

    property int padding: 2
		property var workspaces: Hyprland.workspaces.values.filter(w => !w.name.startsWith("special"))
		property int focused: Hyprland.focusedWorkspace?.id ?? 0
		property bool hasSpec: Hyprland.workspaces.values.filter(w=> !w.name.startsWith("special"))

    color: D.General.widRect? D.Colors.widget : "transparent"
    implicitHeight: parent.height
    implicitWidth: row.implicitWidth + padding
		radius: D.General.radius


   // anchors {
   //     left: parent.left
    //}

    Row {
        id: row

        spacing: 1

        anchors {
					centerIn: parent

        }

				Repeater {
            id: rep

						model: win.workspaces

            delegate: Rectangle {
							id: wkspc

								required property int index
								required property var modelData
                property bool hovered: false

                radius: win.radius
								color: {
									if (!D.General.widRect)
									return "transparent"
                    if (hovered)
										return D.Colors.bg;
										if (focused === wkspc.modelData.id)
										return D.Colors.fg
										else
										return D.Colors.surface

                }
                width: height^2
                height: win.height - win.padding

								MouseArea {
									enabled: true
                    anchors.fill: parent
                    onHoveredChanged: wkspc.hovered = !wkspc.hovered
                    hoverEnabled: true
                    onClicked: Hyprland.dispatch('hl.dsp.focus({workspace="%1"})'.arg(wkspc.modelData.id))
                }

								Text {
									id: text
									text: wkspc.modelData.id

									font{
										family: D.General.family
										pointSize: D.General.size
										bold: D.General.bold
									}
									color: ((win.focused === wkspc.modelData.id) && D.General.widRect) ? D.Colors.bg : ( !D.General.widRect && wkspc.hovered ) ? D.Colors.surface : D.Colors.fg

										Behavior on color{
											ColorAnimation{
												duration: D.General.animDur
											}
										}

                    anchors {
                        //fill: parent
                        centerIn: parent
                    }

                }

                Behavior on color {
                    ColorAnimation {
                        duration: D.General.animDur
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
			Rectangle{
				id: spec
				width: 1
				height: 1
				visible: false//win.hasSpec && D.General.widRect
				Behavior on visible{
					NumberAnimation{
						duration: D.General.animDur		
					}
				}
				anchors{
				fill: parent
				margins: 1
			}

			Text{
				font{
					family: D.General.family
					pointSize: D.General.size
				}
				anchors{
					
					centerIn: parent
				}
				text: "Special " 
			}
	}

}
