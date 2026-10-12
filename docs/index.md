## Goal
To make a cool Quickshell interface with QML using examples and configs I already have so my rice is cooler.

## What do I have?
- Arch Linux
- Code - OSS
- Obsidian
- The internet
- Water
## What Was Difficult?
I wanted to reflect on the relatively poor performance I delivered. I've never really used Quickshell... well, I've *used* it but never wrote with it so everything was pretty foreign to me. 
First of all, I'm not at all good at coding but I sort of found out that Quickshell is really *really* easy.. doesn't mean I can make good stuff though.
### Annoying
Honestly, Quickshell is pretty cool but QML is.. well it's odd. I don't have quite enough experience to make a valid opinion on it but its a little weird.
I probably can't express this with words very easily but QML (and Qt specifically) is something that you can get to *work* but bugs (not necessarily errors) are way easier to make and at some point, you make this disgusting web of UI components that make the code hard to read and hard to fix issues. Maybe this is just my problem idk (ᵕ—.—).
Also, for some reason `SystemClock` just makes the bar vanish? Please debug this, me, but it doesn't kill Quickshell. The bar just vanishes.

## Next Steps
As a sort of guide for me, what do I want to do next?
Well I need to fix the bugs of course, the bar is ridden with those. Other than bugs, I would like to implement a sort of settings menu that changes basic stuff like font size and font family, as well as make it possible to easily configure widgets. The bar layout already makes this quite easy but I still need to figure out how I would do this.

### Features
- That settings launcher
	- Here's where QML kind of shines, it can parse data from JSON for example so I could just have a `pragma Singleton` type file with settings that takes info from the JSON. I'd create this data using the settings launcher thing, which uses `TextField` or similar to take input from users and give the JSON a default so QML doesn't read nothing.
### Bugs 
- (I think??) `SystemClock` seems to be breaking stuff? It just makes the bar disappear quietly and doesn't kill Quickshell, it just goes away and keeps the wallpaper
- Rectangles not showing up??? Widgets function and stuff but they do not have rectangles as I planned, I just kept them 'invisible' for now.
- More widgets. Not a bug but widgets are quite easy to make with the `Widget.qml` file I have. For me, all widgets just take in text or icons from where they are called. Issue with this is that traditional workspace `Repeater` thing you see can't rely on this, which is fine. For other widgets like an audio visualizer, I would also need a custom widget.

## References
- RexCrazy804's Quickshell [`basic_bar` example](https://github.com/Rexcrazy804/quickshell-examples/)
- SelfMadeSystem's Quickshell [`shader_wallpaper` examaple](https://github.com/SelfMadeSystem/quickshell-examples/)
- [Quickshell docs](https://quickshell.org/docs/v0.3.0/types/)
- [QtQuick docs](https://doc.qt.io/qt-6/qtquick-index.html)
