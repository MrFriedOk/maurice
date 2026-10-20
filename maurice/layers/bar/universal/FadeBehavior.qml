import QtQuick

Behavior {
    id: root

    property Item fadeTarget: targetProperty.object

    SequentialAnimation {
        id: seq

        NumberAnimation {
            id: on

            duration: 80
            target: root.fadeTarget
            property: "opacity"
            to: 0
            easing.type: Easing.InQuad
        }

        PropertyAction {
        }

        NumberAnimation {
            id: off

            duration: 80
            target: root.fadeTarget
            property: "opacity"
            to: 1
            easing.type: Easing.OutQuad
        }

    }

}
