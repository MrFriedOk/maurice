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
Honestly, Quickshell is pretty cool but QML is.. well it's odd. I don't have quite enough experience to make a valid opinion on it but it's a little weird. QML is weirdly forgiving, you can basically violate syntax and it just goes ¯\\_(ツ)_/¯ and moves on. When this is paired with UI creation, it makes the stupidest things so difficult to debug. Also doesn't help that I'm not good at it.
I probably can't express this with words very easily but QML (and Qt specifically) is something that you can get to *work* but bugs (not necessarily errors) are way easier to make and at some point, you make this disgusting web of UI components that make the code hard to read and hard to fix issues. Maybe this is just my problem idk (ᵕ—.—).
Also, for some reason `SystemClock` just makes the bar vanish? Please debug this, me, but it doesn't kill Quickshell. The bar just vanishes.

> [!NOTE] `SystemClock` thing
> Quick update, the issue was resolved by setting the precision to minutes? No idea why it would kill the bar on seconds but idk.. (¬_¬)

## Next Steps
As a sort of guide for me, what do I want to do next?
Well I need to fix the bugs of course, the bar is ridden with those. Other than bugs, I would like to implement a sort of settings menu that changes basic stuff like font size and font family, as well as make it possible to easily configure widgets. The bar layout already makes this quite easy but I still need to figure out how I would do this.

### Features
- That settings launcher
	- Here's where QML kind of shines, it can parse data from JSON for example so I could just have a `pragma Singleton` type file with settings that takes info from the JSON. I'd create this data using the settings launcher thing, which uses `TextField` or similar to take input from users and give the JSON a default so QML doesn't read nothing.
	- More widgets. Widgets are quite easy to make with the `Widget.qml` file I have. For me, all widgets just take in text or icons from where they are called. Issue with this is that traditional workspace `Repeater` thing you see can't rely on this, which is fine. For other widgets like an audio visualizer, I would also need a custom widget.
### Bugs 
- (I think??) `SystemClock` seems to be breaking stuff? It just makes the bar disappear quietly and doesn't kill Quickshell, it just goes away and keeps the wallpaper
- Rectangles not showing up??? Widgets function and stuff but they do not have rectangles as I planned, I just kept them 'invisible' for now.
## Assessment
### By Week
`Sramble.qml` was created by an LLM. I modified the file but all the logic is entirely AI, not made by me.
- **P3**
	- **Built**
		- The most noticeable difference from this week to last week is the general look. While the structure is mostly the same (albeit, a little more polished internally but still a mess), there are more obvious aesthetic things going on.
		- There are also more widgets, this was the easiest part to do because I had already defined a `Widget.qml` thing that I could call over and over again and for the most part, it worked. For other widgets like the workspace type widgets, I created those separately, just mostly `Text` in an `Item`. Individual widgets include volume, brightness (WIP) and session control. The battery still works as always, I did add a little bit of logic though, it just checks the level and returns different colors for the text based on level. Volume has a similar function, if it's above 100% (or 1.00, in this case, I like floating idk I'm sorry lol), it returns a different text and color. Very easy logic. Session control is modular is somewhat of a weird way, the right next on the widget determines what it does. For example, 'SUSP' suspends the device (just a `systemctl suspend`), 'OFF' shuts off the device. There are more options but I was kind of building it around the assumption that a user wouldn't put other text there but if anything is used that isn't listed in the logic, it just shatters. 
		- Another more major feature added is a lock screen, it doesn't do PAM yet (but you can escape via a box in the top left, so secure, I know) but I mostly set up the structure for more stuff to be added and so far, it's just a clock and a `PanelWindow` that covers the screen in a weird way for now. 
		- Notifications started, Quickshell now handles notifications, it makes a server (so it breaks other daemons), although it doesn't provide feedback yet. So far the actual notification object that pops up is a fat rectangle that can hold information.
		- The stuff I changed internally are mostly things that help with future modularity and stuff, like fixing anchors and layout so that the 'sections' actually function like I wanted them to 
	- **Future**
		- Like I started (I got.. a file created and a vision, also a `HoverHandler`), I want to make that settings launcher where you can easily access general data stuff like font family, point size, widgets, spacing and colors. 
		- More widgets to be made, there always is. Specifically the `Workspaces.qml` widget, I need to make the logic cooler so that it behaves like an actual workspace interface thing.
		- Center the clock.
		- Enhance the lock screen. Right now it's just a clock and a session lock (,,>﹏<,,) <sub><sub>like maybe idk make a stupid amount of animations</sub></sub>
		- Make widgets less ugly
	- **Fix**
		- There are no actual damaging bugs, QML is funny that way.  This does not mean that there are zero bugs, quite the opposite. I will need to go through and remove some useless properties for example. 
		- Brightness currently broken, I literally know exactly what it is but forgot to fix it. Will also need to add some stuff to check for a backlight device (and make sure one actually exists) and then select it so shows brightness for any device without modification. After this is done, I can also implement backlight brightness manipulation.
## References
- RexCrazy804's Quickshell [`basic_bar` example](https://github.com/Rexcrazy804/quickshell-examples/)
- SelfMadeSystem's Quickshell [`shader_wallpaper` examaple](https://github.com/SelfMadeSystem/quickshell-examples/)
- [Quickshell docs](https://quickshell.org/docs/v0.3.0/types/)
- [QtQuick docs](https://doc.qt.io/qt-6/qtquick-index.html)
