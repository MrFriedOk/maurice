import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Rectangle {
    id: root

    property var player: D.General.player
    property string art: player.trackArtUrl
property int margin: 5
    color: D.Colors.widget
    width: 1000
    height: 400
    radius: D.General.radius

    anchors {
        centerIn: parent
        verticalCenterOffset: 100
			}
			Rectangle{
				anchors{
					top: parent.top
					bottom: parent.bottom
					right: parent.right
					margins: root.margin
				
				}
				width: parent.width - (artContainer.width + (root.margin *2))
			Text{
				anchors{
					top: parent.top

				}
				property list<string> splash: ["Now playing,","You are now enjoying,","Some cringy splash,","What would spotify say?"]
			}
		}

		Rectangle {
			id: artContainer
			//cover art
        color: D.Colors.surface
        width: parent.height
        radius: parent.radius

        Image {
            clip: true
            source: root.art

            anchors {
                fill: parent
            }

        }

        anchors {
            margins: root.margin
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }

    }

}
