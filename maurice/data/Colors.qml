import QtQuick
import Quickshell
pragma Singleton

//the colors (temp)
Singleton {
    property color bg: ColorsGen.palette.primary5 //'#131313'
    property color surface: ColorsGen.palette.tertiary50 //'#565656'
    property color widget: ColorsGen.palette.primary50 //'#1a80cc'
    property color fg: ColorsGen.palette.secondary80 //'#d1d1d0'
    property color accent: ColorsGen.md3.error //'#cececc'
    property color critical: '#881717'
    property color warn: '#c66312'
    property color med: '#cab32f'
    property color up: '#27f546'
    property color dwn: critical
}
