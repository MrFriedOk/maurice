import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland
import "../../../data" as D
import "../universal" as Wi

Item{
    id: win

    readonly property string wkspc: activeWindow?.activated ? activeWindow?.appId : "desktop"
		readonly property Toplevel activeWindow: ToplevelManager.activeToplevel
		property int padding: 5

		implicitWidth: wid.implicitWidth + padding
	//	Layout.fillWidth: true
	Layout.fillHeight: true
	Wi.Scramble{
		target: win.wkspc
		color: D.Colors.fg
	}

//		Text{
//			text: win.wkspc
//			anchors{
//				verticalCenter: parent.verticalCenter	
//			}
//			color: D.Colors.fg
//			font{
//				family: D.General.family
//				bold: D.General.bold
//				pointSize: D.General.size
//			}
//		}

}
