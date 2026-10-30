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
    id: root

    //ipc for control from hyprland, not in rice as of now
    IpcHandler {
        target: "lock"
        function lock(): void {
            root.locked = !root.locked;
        }//{locked = true;} //D.General.barVisible = !D.General.barVisible}
    }

    //Timer{
    //	running: root.locking
    //	interval: 0
    //onTriggered: {root.locked = !root.locked; root.locking = !root.locking}
    //}

    //function unlocking(){
    //	if (!root.locked)
    //	console.log("gay")
    //}

    property bool locked: false
    property bool locking: false
    property bool unlocking: false
    //property var fonts: D.General.fonts
    //property string curFont: ""
    property string curFont: D.General.family

    WlSessionLock {
        id: lock

        locked: root.locked

        Self.Surface {}
    }
    SystemClock {
        id: clock
        enabled: true
        precision: SystemClock.Seconds
    }

    Self.Context {
        id: ctx
        property int length: 3
    }

    Connections {
        target: ctx
        function onUnlocked() {
            root.locked = false;
        }
    }
}
