import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

Rectangle {
    //}
    //}
    //function posChanged() {
    //    text.text = root.pos;
    //}
    //Image {
    //    source: root.art
    //  anchors {
    //       centerIn: parent
    //   }
    //}
    //learning stuff and waste of space
    //Row {
    //  anchors {
    //    centerIn: parent
    //}
    //Repeater {
    //  model: root.stuff
    //delegate: Text {
    //  id: text
    //required property var modelData
    //text: modelData
    //Timer {
    //    interval: 1000
    //    running: true
    //    repeat: true
    //   onTriggered: root.player.posChanged
    //}

    id: root

    //omg my naming is actually so good
    property bool trans: !D.General.widRect
    property string loop: "LOOP"
    property string pause: "PAUSE"
    property string next: "NEXT"
    property string last: "LAST"
    property real pos: player.position
    //property ObjectModel players: Mpris.players
    property var stuff: ["thing1", "thing2"]
    property string loopState: toString(player.loopState)
    property bool open: false
    property bool hovered: false
    readonly property var player: {
        const list = Mpris.players.values;
        return list.find((p) => {
            return p.playbackState === MprisPlaybackState.Playing;
        }) ?? list[0] ?? null;
    }
    property string track: player.trackTitle
    property string artist: player.trackArtist
    property string album: player.trackAlbum
    property string art: player.trackArtUrl

    width: 200
    color: trans ? "transparent" : D.Colors.widget
    height: D.General.barHeight

    FrameAnimation {
        // only emit the signal when the position is actually changing.
        running: player.playbackState == MprisPlaybackState.Playing && open
        // emit the positionChanged signal every frame.
        onTriggered: player.positionChanged()
    }
    //}

    Text {
        //height: D.General.barHeight / 2

        id: text

        text: root.pos

        anchors {
            verticalCenter: parent.verticalCenter
        }

    }

    MouseArea {
        hoverEnabled: true
        onHoveredChanged: root.hovered = !root.hovered
        onClicked: root.open = !root.open

        anchors {
            fill: parent
        }

    }

    PopupWindow {
        id: pop

        property int expand: 250

        visible: root.open
        color: "transparent"
        relativeX: -expand / 2
        relativeY: root.height
        width: root.width + expand
        height: 150

        anchor {
            //edges: Edges.Bottom | Edges.Left
            //gravity: Edges.Bottom | Edges.Right

            item: root
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
                            leftMargin: pop.height
                        }

                        Wi.Scramble {
                            id: trackTitle

                            width: parent.width / 1.05
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
                                leftMargin: topMargin
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
                            id: playback

                            property var content: [root.last, root.loop, root.pause, root.next]

                            height: 25
                            color: D.Colors.surface
                            width: 40

                            Row {
                                spacing: parent.width / 4

                                Repeater {
                                    model: playback.content

                                    delegate: Text {
                                        required property var modelData

                                        text: modelData
                                        color: D.Colors.fg

                                        anchors {
                                            verticalCenter: parent.verticalCenter
                                        }

                                    }

                                }

                                anchors {
                                    fill: parent
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

                        anchors {
                            left: parent.left
                            top: parent.top
                            bottom: parent.bottom
                            margins: 4
                        }

                        Image {
                            source: root.art
                            clip: true

                            anchors {
                                fill: parent
                            }

                        }

                    }

                }

            }

        }

    }

}
