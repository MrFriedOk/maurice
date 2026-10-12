//imports
import Quickshell
import Quickshell.Io
import QtQuick
import "./layers" as E

ShellRoot {
    property int wall: 0
    // call background
    E.Background{}
    // call top layer (the bar and other stuff maybe)
    E.Top {}

   // E.Background{}
}
