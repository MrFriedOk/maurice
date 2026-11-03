import "."
import "./settings" as S
import "./dash" as Da
import "./lyrics" as L
import QtQuick
import Quickshell

Scope {
    LauncherPrompt {}

    S.Settings {}
    Da.Dash {}
    L.Lyrics {}
}
