pragma Singleton
import QtQuick
import Quickshell

//the colors (temp)
Singleton {
    property color bg: ColorsGen.md3.background
    property color surface: ColorsGen.md3.surface_variant //ColorsGen.palette.tertiary50 //'#565656'
    property color widget: ColorsGen.md3.surface_container //ColorsGen.palette.primary50 //'#1a80cc'
    property color fg: ColorsGen.md3.tertiary //ColorsGen.palette.secondary80 //'#d1d1d0'
    property color accent: ColorsGen.md3.secondary //ColorsGen.md3.error //'#cececc'
    property color idk: ColorsGen.md3.primary
    property color critical: ColorsGen.md3.error //'#881717'
    property color warn: ColorsGen.md3.error //'#c66312'
    property color med: '#cab32f'
    property color up: '#27f546'
    property color dwn: critical
    property color light: ColorsGen.md3.on_tertiary

    //super efficient
    Behavior on bg {
        ColorAnimation {
            duration: 400
        }
    }

    Behavior on surface {
        ColorAnimation {
            duration: 400
        }
    }

    Behavior on widget {
        ColorAnimation {
            duration: 400
        }
    }

    Behavior on fg {
        ColorAnimation {
            duration: 400
        }
    }

    Behavior on accent {
        ColorAnimation {
            duration: 400
        }
    }
    //ColorsGen.palette.primary5 //'#131313'

}
