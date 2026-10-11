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

	color: D.Colors.bg
	anchors{
		//bottom: true
		left: true
		right: true
		top: true
	}
	//pretty sure this is the default, but this should let the bar shove windows out of the way. Ignore to.. not do that
	exclusionMode: ExclusionMode.Auto
	implicitHeight: 20
	//implicitWidth: 30
		
	//left, middle and right

	Item{
		anchors.fill: parent

		S.Left{}
		
		S.Middle{}

		S.Right{}
	// Rectangle{
	// 	anchors{
	// 		right: parent.right
	// 		top: parent.top
	// 		bottom: parent.bottom
	// 	}
	// 	width: 100
	// 	color: D.Colors.fg
	// }
	// Rectangle{
	// 	anchors{
	// 		left: parent.left
	// 		top: parent.top
	// 		bottom: parent.bottom
	// 	}
	// 	width: 100
	// 	color: D.Colors.fg
	// }
	}
}