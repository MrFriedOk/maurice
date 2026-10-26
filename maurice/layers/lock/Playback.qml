import "../../data" as D
import QtQuick
import Quickshell
import Quickshell.Io
import Quickshell.Services.Mpris

Rectangle {
    id: root

		property bool locking: false
    property var player: D.General.player
		property string art: player.trackArtUrl
		property string pause: "PAUSE"
		property string loop: "LOOP"
		property int margin: 5
    color: D.Colors.surface
    width: 1000
    height: 400
    radius: D.General.radius

    anchors {
        centerIn: parent
        verticalCenterOffset: 100
			}
			Rectangle{
				radius: parent.radius
				Rectangle{

					color: D.Colors.surface
					radius: root.radius
					anchors{
						bottom: parent.bottom
						left: parent.left
						right: parent.right
						margins: 25
					}
					height: 50
					//playback control container
					id: playbackCtl
					
					property list<string> playback: ["LAST",root.pause,root.loop,"NEXT"]

					Row{

						Repeater{
							//individual playback ctl
							model: playbackCtl.playback

							delegate: Rectangle{
								radius: root.radius
								Text{
									anchors{
										fill: parent
									}
									text: modelData
								}
								required property var modelData
								required property int index
								anchors{
									top: parent.top
								  bottom: parent.bottom
								}
								width: 50
							}

						}
					}
				}

				color: D.Colors.bg
				anchors{
					top: parent.top
					bottom: parent.bottom
					right: parent.right
					margins: root.margin
				
				}
				//weird ahh math
				width: parent.width - (artContainer.width + (root.margin *3))

				Text{
					id: splashTxt
					width: parent.width
					text: curSplash
					Rectangle{
						color: '#5d5d5d00'
						anchors{
							fill: parent
						}
					}
				anchors{
					top: parent.top
					centerIn: parent
					//horizontalCenterOffset: splashTxt.width/2
					verticalCenterOffset: -150
				
				}
				color: D.Colors.fg
				font{
					family: D.General.family
					bold: true
						pointSize: (splashTxt.implicitWidth > splashTxt.width)? 2 : 20

					}
				property int index: Math.floor(Math.random()*splash.length)
				property string curSplash: splash[index]
				property list<string> splash: D.General.splashes//["Now playing,","You are now enjoying,","Some cringy splash,","What would spotify say?"]
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
