//ATTENTION
//if you like find this or something, i really want you to know that this part of the code
//was in fact written by ai, i couldnt log the time tho, it was like 2 seconds and a single file
//i did, however, modify the code a bit and may rewrite it eventually

import "../../../data" as D
// ScrambleText.qml
import QtQuick

Text {
    id: root

    property string target: ""
    property string chars: "!<>-_\\/[]{}=+*^?#abcdefghijklmnopqrstuvwxyz0123456789"
    property int fpms: 30
    property int fpc: 1
    property int frame: 0

    function replay() {
        frame = 0;
        timer.restart();
    }

    onTargetChanged: replay()

    font {
        family: D.General.family
        bold: D.General.bold
    }

    Timer {
        id: timer

        interval: root.fpms
        repeat: true
        onTriggered: {
            root.frame++;
            const locked = Math.floor(root.frame / root.fpc);
            let out = "";
            for (let i = 0; i < root.target.length; i++) {
                const c = root.target[i];
                if (i < locked || c === " ")
                    out += c;
                else
                    out += root.chars[Math.floor(Math.random() * root.chars.length)];
            }
            root.text = out;
            if (locked >= root.target.length)
                stop();

        }
    }

}
