import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "./background" as Bak

Variants {
    model: Quickshell.screens

    Bak.Wallpaper{}
}
