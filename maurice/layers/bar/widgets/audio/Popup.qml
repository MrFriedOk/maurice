import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

PopupWindow {
    id: root

    property string track: player.trackTitle
    property string artist: player.trackArtist
    property string album: player.trackAlbum
    readonly property real remain: (pos / len)
    property string art: player.trackArtUrl
    property var stuff: ["thing1", "thing2"]
    property string loopState: player.loopState
    readonly property var player: D.General.player
    //why did i do it this way?
    property string loop: "LOOP"
    property string pause: player.isPlaying ? "PAUSE" : "PLAY"
    property real pos: player.position
    readonly property bool seek: player.canSeek && player.lengthSupported && player.positionSupported
    readonly property real len: player.length

    visible: false
    color: "transparent"
    relativeX: -expand / 2
    relativeY: parent.height
    height: 150

    FrameAnimation {
        // only emit the signal when the position is actually changing.
        running: player.playbackState == MprisPlaybackState.Playing && root.visible && root.seek
        // emit the positionChanged signal every frame.
        onTriggered: player.positionChanged()
    }

    Item {
        id: widget

        anchors {
            fill: parent
        }

        Rectangle {
            //top rect, ignore dihs one, me
            color: D.Colors.widget
            radius: D.General.radius

            anchors {
                fill: parent
            }

            Rectangle {
                //inner rect, put stuff in dihs one
                Layout.fillHeight: true
                radius: parent.radius
                color: D.Colors.surface

                anchors {
                    fill: parent
                    margins: 4
                }

                Rectangle {
                    //inner text content
                    radius: D.General.radius
                    color: D.Colors.bg

                    anchors {
                        fill: parent
                        margins: 4
                        leftMargin: root.height
                    }

                    Rectangle {
                        //total of song
                        visible: root.seek
                        height: 5
                        width: parent.width - 20
                        color: D.Colors.surface
                        radius: D.General.radius

                        anchors {
                            left: parent.left
                            right: parent.right
                            centerIn: parent
                            verticalCenterOffset: 10
                        }

                        MouseArea {
                            //seek
                            anchors {
                                fill: parent
                            }

                        }

                        Rectangle {
                            //progress bar
                            color: D.Colors.fg
                            width: parent.width * root.remain
                            radius: parent.radius

                            anchors {
                                top: parent.top
                                bottom: parent.bottom
                                left: parent.left
                            }

                        }

                    }

                    Wi.Scramble {
                        id: trackTitle

                        width: parent.width / 1.5
                        // wrapMode: Text.Wrap
                        elide: Text.ElideRight
                        color: D.Colors.fg
                        target: root.track

                        font {
                            pointSize: 16
                        }

                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 5
                            leftMargin: 5
                            top: parent.top
                        }

                    }

                    Wi.Scramble {
                        id: otherStuff

                        color: D.Colors.fg
                        width: parent.width / 2
                        elide: Text.ElideMiddle
                        target: root.artist + " : " + root.album

                        font {
                            pointSize: trackTitle.font.pointSize / 2
                        }

                        anchors {
                            horizontalCenter: parent.horizontalCenter
                            topMargin: 25 + trackTitle.anchors.topMargin
                            top: parent.top
                        }

                    }

                    Rectangle {
                        //width: 40

                        id: playback

                        property var content: ["LAST", root.loop, root.pause, "NEXT"]

                        height: 25
                        color: D.Colors.surface

                        Row {
                            id: row

                            spacing: 2

                            anchors {
                                fill: parent
                            }

                            Repeater {
                                //width: playback.width / 4

                                model: playback.content

                                delegate: Rectangle {
                                    id: playbackRoot

                                    required property var modelData
                                    required property int index
                                    property bool hovered: false

                                    color: hovered ? D.Colors.surface : D.Colors.widget
                                    width: (playback.width - (row.spacing * playback.content.length)) / playback.content.length

                                    Text {
                                        //property var cols: [D.Colors.fg, D.Colors.bg]
                                        //property var col: cols[0]

                                        id: playbackTxt

                                        text: playbackRoot.modelData
                                        color: D.Colors.fg //cols[0]

                                        anchors {
                                            //fill: parent
                                            centerIn: parent
                                        }

                                    }

                                    MouseArea {
                                        enabled: true
                                        hoverEnabled: true
                                        onHoveredChanged: playbackRoot.hovered = !playbackRoot.hovered
                                        onClicked: {
                                            if (modelData === "NEXT")
                                                return root.player.next();

                                            if (modelData === "LAST")
                                                return root.player.previous();

                                            if (modelData === "LOOP")
                                                return console.log(root.loopState);

                                            if (modelData === "PAUSE")
                                                return root.player.pause();

                                            if (modelData === "PLAY")
                                                return root.player.play();

                                        }

                                        anchors {
                                            fill: parent
                                        }

                                    }

                                    anchors {
                                        //horizontalCenterOffset: index * 25
                                        //centerIn: parent
                                        //verticalCenter: parent
                                        margins: row.spacing
                                        top: parent.top
                                        bottom: parent.bottom
                                    }

                                    Behavior on color {
                                        ColorAnimation {
                                            duration: D.General.animDur
                                        }

                                    }

                                }

                            }

                            anchors {
                                centerIn: parent
                            }

                        }

                        anchors {
                            bottom: parent.bottom
                            right: parent.right
                            left: parent.left
                            margins: 10
                        }

                    }

                }

                Rectangle {
                    //radius: parent.radius

                    //can you 'clip' images to fit inside a rectangle?
                    width: parent.height
                    color: "transparent"

                    anchors {
                        left: parent.left
                        top: parent.top
                        bottom: parent.bottom
                        margins: 4
                    }

                    Image {
                        source: root.art
                        clip: true
                        smooth: true

                        anchors {
                            fill: parent
                        }

                    }

                }

            }

        }

    }

}
