import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io

Rectangle {
    id: root

		property bool hovered: false
		property list<string> funcs : ["Z","L","O","R"]

    color: D.Colors.widget
    width: 50
    implicitHeight: 200
    height: hovered ? implicitHeight : 50
    radius: D.General.radius

    MouseArea {
        hoverEnabled: true
        enabled: true
        onHoveredChanged: root.hovered = !root.hovered

        anchors {
            fill: parent
        }

    }

    anchors {
        margins: 5
        top: parent.top
        right: parent.right
    }

    Behavior on height {
        NumberAnimation {
            duration: D.General.animDur
        }

			}
			Column{
				spacing: 10
				anchors{
					fill: parent
				}
				Repeater{
					model: root.funcs
					delegate: Rectangle{
						id: btnCont
						required property string modelData

						Text{
							text: btnCont.modelData
						}
					}
				}
		}

}
