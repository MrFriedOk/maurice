import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import "./widgets" as W
import "../../data" as D

Scope {
    Variants {
	id: delegate

	model: Quickshell.screens
	
	delegate: 
    }
}
