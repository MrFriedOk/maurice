import "../../../../data" as D
import "../../universal" as Wi
import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire

Item {
    property PwNode defNode: Pipewire.defaultAudioSink
    property bool mute: defNode.audio.muted
    property real vol: defNode.audio.volume.toFixed(2)
    property string volStr: defNode.audio.volume.toFixed(2)
    //reference point to a real, idk why i made this
    property real ref: 0
    property int padding: 0

    implicitWidth: wid.implicitWidth + padding
    Layout.fillHeight: true

    PwObjectTracker {
        objects: [defNode]
    }

    Wi.Widget {
        // check if mute is true. if version better idk

        id: wid

        //icon.text: mute ? "MUT":"VOL"
        icon.text: {
            if (vol > 1)
                return "HI";

            if (mute === true)
                return "MUT";
            else
                return "VOL";
        }
        //text.horizontalAlignment: text.AlignRight
        //icon.color: mute ? D.Colors.fg:D.Colors.surface
        icon.color: {
            if (vol > 1)
                return D.Colors.critical;

            if (mute === true)
                return D.Colors.fg;

            if (mute === false)
                return D.Colors.surface;

        }
        text.text: {
            //check if vol === to ref, return 0.00 string
            //otherwise, return vol
            if (vol === ref)
                return "OFF";
            else
                volStr;
        }
        text.color: D.Colors.fg
    }

}
