import QtQuick
import Quickshell
pragma Singleton

//the colors (temp)
Singleton {
    property color bg: ColorsGen.md3.background //ColorsGen.palette.primary5 //'#131313'
    property color surface: ColorsGen.md3.surface_variant //ColorsGen.palette.tertiary50 //'#565656'
    property color widget: ColorsGen.md3.surface_container //ColorsGen.palette.primary50 //'#1a80cc'
    property color fg: ColorsGen.md3.tertiary //ColorsGen.palette.secondary80 //'#d1d1d0'
    property color accent: ColorsGen.md3.tertiary //ColorsGen.md3.error //'#cececc'
    property color critical: '#881717'
    property color warn: '#c66312'
    property color med: '#cab32f'
    property color up: '#27f546'
    property color dwn: critical
}
