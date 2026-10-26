import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pam
import Quickshell.Wayland
import Quickshell.Io
import "../../data" as D
import "../bar/universal" as Wi
import "./" as Self

Scope {

	//ipc for control from hyprland, not in rice as of now
	IpcHandler{
		target: "lock"
		function lock(): void {root.locking = !root.locking}//{locked = true;} //D.General.barVisible = !D.General.barVisible}
	}
	id: root

	Timer{
		running: root.locking
		interval: 0
		onTriggered: {root.locked = !root.locked; root.locking = !root.locking}
	}

	function unlocking(){
		if (!root.locked)
		console.log("gay")
	}


	property bool locked: false
	property bool locking: false
	property bool unlocking: false
		//property var fonts: D.General.fonts
		//property string curFont: ""
		property string curFont: D.General.family
		onLockedChanged: D.General.barVisible = !D.General.barVisible

    WlSessionLock {
        id: lock

        locked: root.locked

				WlSessionLockSurface {
					color: "transparent"
					
					Item{
					
						
						anchors{
							fill: parent	
						}
						
							Layout.fillWidth: true
							Layout.fillHeight: true
							//escape box
							MouseArea{
								width: 25
								height: 10

								enabled: true
							anchors{
								top: parent.top
								left: parent.left
							}
							Rectangle{
								anchors{
									fill: parent
								}
							}
							//onHoveredChanged: parent.color: "green"
							onClicked: root.locked = false
						}
						PanelWindow{
							Self.Playback{
							}

							Rectangle{
								//pam container
								color: D.Colors.surface
								radius: D.General.radius
								Rectangle{
									anchors{
										fill: parent
										margins: 5
									}
									color: D.Colors.bg

									TextInput{
										id: pam
										text: "hi"
										color: D.Colors.fg
										focus: true
										onAccepted: {
											ctx.submit(text); text=""
										}
										anchors{
											fill: parent
										}
										enabled: !ctx.busy
										echoMode: TextInput.Password
										inputMethodHints: Qt.ImhSensitiveData
									}
								}
								anchors{
									bottomMargin: 50
									bottom: parent.bottom
									horizontalCenter: parent.horizontalCenter
								}
								width: 400
								height: 50
							}

							id: bg

							anchors{
								top: true
								bottom: true
								left: true
								right: true

							}
							color: "#bb000000"

					//BackgroundEffect.blurRegion: Region{item: bg.contentItem}

						}

						Rectangle{ 
							//clock
							color: D.Colors.surface
							height: 200
							width: 500
							radius: D.General.radius + 9
							anchors{
								top: parent.top
								horizontalCenter: parent.horizontalCenter
								topMargin: 100
							}
							Wi.Scramble{
								anchors{
									horizontalCenter: parent.horizontalCenter
									verticalCenter: parent.verticalCenter
								}
							id: text
							target: Qt.formatTime(clock.date, "hh:mm")
						font.pointSize: 96
						color: D.Colors.fg
						fpc: 3
						font.family: root.curFont

						Timer{
							interval: 1000
							running: false
							repeat: true
							onTriggered: {
								let next
								do { next = root.fonts[Math.floor(Math.random()*root.fonts.length)]}
								while (next === root.curFont)
								root.curFont = next
							}
						}

					}

					}
					}

            

        }

			}
			SystemClock{
				id: clock
				enabled: true
				precision: SystemClock.Seconds 
			}

			Self.Context{
				id: ctx
			}

			Connections{
				target: ctx
				function onUnlocked(){
					root.locked = false
				}
			}
}
