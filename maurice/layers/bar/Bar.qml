import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "./sections" as S
import "../../data" as D

//the actual bar component
PanelWindow {

	//reference the screen from Top.qml
	required property var modelData
	screen: modelData

	color: "transparent"
	anchors{
		//bottom: true
		left: true
		right: true
		top: true
	}
	implicitHeight: 20
	//implicitWidth: 30
	//color: D.Colors.withAlpha(D.Colors.md3.background,.5)

	//color: "transparent"
		//iterate across the left, middle and right
		RowLayout{
			S.Left{
				Layout.fillWidth: true
				Layout.fillHeight: true
			}
			S.Right{
				Layout.fillWidth: true
				Layout.fillHeight: true
			}

		}
}