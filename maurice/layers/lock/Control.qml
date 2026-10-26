import Quickshell
import QtQuick
import "../../data" as D

Rectangle{

				Text{
					
				}

				Text{
					//track title
				text: root.player.trackTitle
				color: D.Colors.fg
				font{
					family: D.General.family
					bold: true
					pointSize: 18
				}
				width: parent.width
				anchors{
					//horizontalCenter: parent.horizontalCenter
				centerIn: parent
				}
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
