import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import QtQuick.Layouts

Rectangle {
    id: root

		property bool hovered: false
		property list<string> funcs : ["Z","L","O","R"]

    color: D.Colors.surface
		//width: 50
		width: 35
    implicitHeight: (hovered ? funcs.length:1)*(width+10)//200
    //height: hovered ? implicitHeight : 50
    radius: D.General.radius

    MouseArea {
        hoverEnabled: true
				//enabled: true
        onHoveredChanged: root.hovered = !root.hovered

        anchors {
            fill: parent
					}

			Column{
				clip: true
				spacing: 5
				width: 50
				anchors{
					fill: parent
					margins: 5 
					//top: parent.top
					//bottom: parent.bottom
				}

				Repeater{
					model: root.funcs//root.hovered ? root.funcs : "Z"
					delegate: Rectangle{
						//visible: (modelData === root.funcs[0]|| root.hovered)
						//height: root.implicitHeight / root.funcs.length
						//width: height
						Layout.fillWidth: true
						implicitHeight: width ? width : 1
						id: btnCont
						color: hovered ? D.Colors.surface : D.Colors.widget
						property bool hovered: false
						required property string modelData

						MouseArea{
							hoverEnabled: true
							onHoveredChanged: btnCont.hovered = !btnCont.hovered
							anchors{
								margins: 5
								fill: parent
							}
						}

						anchors{
							horizontalCenter: parent.horizontalCenter
							//left: parent.left
							//right: parent.right
							fill: parent
						}

						Item{
							anchors{
								fill: parent
								centerIn: parent
							}
							Text{
								font{
									pointSize: D.General.size
									family: D.General.family
								}
								color: D.Colors.fg
							anchors{
								fill: parent
								centerIn: parent
							}
							text: btnCont.modelData
							}
					
						}
					}
				}
		}

    }

    anchors {
        margins: 5
        top: parent.top
        right: parent.right
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: D.General.animDur + 80
        }

			}


}
