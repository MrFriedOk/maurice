# Layout
How do I want to break down the layout of the bar?

## Modularity
I can make the bar 'modular' by keeping sections separated (right, left, middle). Inside these sections will be the widgets.

### Widgets
Within sections I can hold widgets, I will create a generic item that can be used across widgets (because they will all look uniform). This item will hold variables which can be modified by the actual widget when it is called.

### Layering
The bar exist in the top layer of Wayland. Under `PanelWindow`, you can simply put `WlrLayershell.layer: WlrLayer.Top`. This is recommended by the Quickshell docs as well, it lets the `PanelWindow` exist with or without Wayland. Well, kind of, but for all of this config, I will assume Wayland is used.
> [!NOTE] Fact
> I should look into it but it seems that Wayland can tell if something is a 'bar', even if the layer is lesser than `Top`.  Maybe this is determined by the `anchors`?

### Screens
using `Variants` (with the `Quickshell.screens` model) under `Scope`, Quickshell applies all my bar configs to every screen. Basically a glorified for loop.

## Pragma

## Imports
- `QtQuick`, QtQuick elements (universal)
- `Quickshell`, Quickshell elements (universal)
- `QtQuick.Layouts`,  used for things like `RowLayouts`. Makes it easy to nest components. Also provides `Qt.LeftToRight` and `Qt.RightToLeft`, useful for the sections I will make in the bar.
- `Quickshell.Wayland`, provides Wayland integration. Will be used mostly for layering as well as locking, backgrounds, idling maybe.
- `Quickshell.Hyprland`, Hyprland integration. This gives Quickshell access to workspace IDs (for the workspace widget) and focusing.

## Behavior
With imports in mind, I can narrow down code that would be used.
```Top.qml
for every screen
Scope{
	Variants{
	model: Quickshell.screens, every screen, put modelData in Bar.qml file as requird property
	
	Bar, call the bar component
	
	
	}
}
```
```Bar.qml
create the bar,
PanelWindow{
	required property var modelData, for iteration across screens
	
	anchors
	
	implicitHeight
	
	WlrLayershell.layer: WlrLayer.Top (not needed but here for clarification)
	
	RowLayout{
		call each section
		
		Left
		
		Right
		
		Middle
	}
}
```
```Left.qml
to hold widgets
RowLayout{
	anchor.left: parent.left, anchor to the left
	layoutDirection: Qt.RightToLeft 
	
	Widgets
}
```
```Widget.qml, the generic widget component that all widgets will use
import like everyting in Quickshell basically

Rectangle{
	id item

	create variables to be used by widgets
	property string icon: "", icons, if used
	property string content: "", data
	
	signal clicked()
	
	RowLayout{
		
		display icon
		display text
		
		MouseArea{
		
			use clicked() function, send to item
		}
	}
	

}

```