import Quickshell
import QtQuick
import "../../data" as D

Rectangle{
				Text{
					//track title
				text: root.player.trackTitle
				color: D.Colors.fg
				font{
					family: D.General.family
					
					pointSize: 18
				}
				width: contentWidth//parent.width/2
				anchors{
					verticalCenterOffset: -65
					//horizontalCenter: parent.horizontalCenter
				centerIn: parent
				}
			}
			Text{
				color: D.Colors.fg
				width: contentWidth //parent.width/2
				
				anchors{
					top: parent.top
					centerIn: parent
				}
				font{
					family: D.General.family
					pointSize: 14

				}
				text: "%1 : %2".arg(root.player.trackArtist,root.player.trackAlbum)
			}
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
					//splash text lol
					id: splashTxt
					width: contentWidth
					text: curSplash
				anchors{
					top: parent.top
					centerIn: parent
					//horizontalCenterOffset: splashTxt.width/2
					verticalCenterOffset: -150
				
				}

			

				color: D.Colors.surface
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
