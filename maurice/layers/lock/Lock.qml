import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pam
import Quickshell.Wayland
import Quickshell.Io
import "../../data" as D
import "../bar/universal" as Wi

Scope {

	//ipc for control from hyprland, not in rice as of now
	IpcHandler{
		target: "lock"
		function lock(): void {locked = true}
	}
    id: root

		property bool locked: false
		property var fonts: ["SpaceMono Nerd Font","Maple Mono NF", "Red Hat Text","Readex Pro","OpenDyslexic Nerd Font", "Atkinson Hyperlegible"]
		property string curFont: ""

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
							exclusionMode: ExlusionMode.Ignore
							id: bg

							anchors{
								top: true
								bottom: true
								left: true
								right: true

							}
							color: "#bb000000"

					BackgroundEffect.blurRegion: Region{item: bg.contentItem}

						}

						Rectangle{ 
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
							running: true
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

}
