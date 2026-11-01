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
    property color light: '#d2e0e0'
    property list<color> lesbian: ['#d62900', '#ff9b55', '#ffffff', '#d462a6', '#a50062']
    property list<color> trans: ['#5bcefa', '#f5a9b8', "#ffffff"]
    property list<color> femboy: ['#d460a7', '#e4adcd', '#ffffff', '#57cef8']
    property list<color> ase: ['#000000', '#a3a3a3', '#ffffff', '#800080']
    property list<color> pan: ['#ff218c', '#ffd800', '#21b1ff']
    property list<color> lesbian7: ['#d52d00', '#ef7627', '#ff9a56', '#ffffff', '#d162a4', '#b55690', '#a30262']
    property list<color> gay7: ['#078d70', '#26ceaa', '#99e8c2', '#ffffff', '#7bade3', '#5049cb', '#3e1a78']
    property list<color> bi: ['#d60270', '#9b4f96', '#0038a8']
    property list<color> enby: ['#fff433', '#ffffff', '#9b59d0', '#2d2d2d']
    property list<color> transMasc: ['#ff8abd', '#cdf5fe', '#9aebff', '#74dfff']
    property list<color> aroAce: ['#e28c00', '#eccd00', '#ffffff', '#62aedc', '#203856']
    property list<color> queer: ['#99d9ea', '#00a2e8', '#b5e61d', '#ffffff', '#ffc90e', '#fd6666', '#ffaec9', '#000000']
    property list<color> progress: ['#e22016', '#66338b', '#fdd817', '#f4aec8', '#ffffff', '#7bcce5', '#945516', '#000000', '#f28917', '#efe524', '#78b82a', '#2c58a4', '#6d2380']
    property list<color> aro: ['#000000', '#ffffff', '#3da542', '#a7d379', '#a9a9a9']
    property list<color> adaptCol: [fg, accent, light]
    property var colorLists: [lesbian, trans, femboy, ase, pan, lesbian7, gay7, bi, enby, transMasc, aroAce, queer, progress, aro, adaptCol]
    property list<color> activeCol: aro

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
