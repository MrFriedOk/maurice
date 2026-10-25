<h1 align=center>maurice</h1>
<h6 align=center>Continuation of previous ricing attempt.</h6>
<div align=center>

![Git](https://img.shields.io/github/last-commit/MrFriedOk/maurice)

</div>

---

## Installing
`shell.qml` is located in the shell folder, `/maurice` and under that same folder is where all the code and assets live. For installation, the release contains a `.zip` of the shell folder.
Quickshell's default config directory is located at `~/.config/quickshell/` and automatically loads the `shell.qml` inside (if it is given). Otherwise, you can point Quickshell to a separate config, providing the respective `shell.qml` (or just the folder).
For install, please move all contents under `/maurice` into Quickshell's default config directory and run Quickshell. 

### Dependencies 
The code in this repo depends on packages/applications besides Quickshell.
  - `brightnessctl`, used for backlight display/manipulation (currently not working anyway lol)
  - [`hyprland`](https://hypr.land/), this is a Hyprland rice. Doesn't necessarily require lua over hyprlang (yet).
  - `pipewire`, used for audio display/manipulation
  - `upower`, battery stuff
  - `cava`, not implemented yet but a `Process` will take streams from `cava` and output to a widget.

#### Arch
```
sudo pacman -S hyprland brightnessctl upower cava pipewire quickshell
```

### Guided
For a standard install, step-by-step
```
cd ~/.cache
git clone https://github.com/MrFriedOk/maurice.git
cd maurice/maurice
mv ~/.config/quickshell ~/.config/quickshell.bak
mkdir ~/.config/quickshell
cp -r ./* ~/.config/quickshell
```
### Usage
Now that the code is in the right place, you can run `qs` (make sure Quickshell is installed) and it will find your code. For a custom path, use `qs -c /path/to/maurice`.
The `-d` flag can be given, this 'daemonizes' Quickshell so you don't get ugly logs and can close your terminal without quitting `qs`. 
For a Hyprland start on login, please append this line to your `hyprland.lua`,
```
hl.exec_cmd('qs')
```
This ensures that Hyprland executes your Quickshell config on login. If Quickshell fails, it will be silent. Best way to pinpoint an error is to run `qs` and check the logs it gives. 
Please let me know if there are any issues! This code sucks!

## Demo
I made a video covering the basic stuff, you can find that under `demo`, I used a song in it too so check out the licensing for that.
For the actual demo, you can use this repo and just point Quickshell to the `maurice` directory, that's where the `shell.qml` is. Sorry, it's kinda unintuitive ( >///< ).
## MkDocs
MkDocs is used to display this repo's docs, simply install MkDocs and serve from this directory!

> [!NOTE]
> Alternatively, you can use the `site` directory, it should contain stuff to serve. From there you can serve the directory any way you want (as long as I remember to keep it up-to-date //v//).

## LLM Use
An LLM was used to generate some code in this repo. `/maurice/layers/bar/universal/Scramble.qml` was created by an LLM and modified by me, I did not make any of the logic

## Licensing
This repo is covered by an MIT license, see [license](./LICENSE). [`demo.mp4` ](./demo/demo.mp4) contains a track "Local Forecast" by Kevin MacLeod (incompetech.com) and is licensed under Creative Commons: By Attribution 4.0 License http://creativecommons.org/licenses/by/4.0/. The MIT does not cover this track and remains under its own terms.
### Fonts
Maple Mono NF, copyright 2022, The Maple Mono Project Authors. Licensed under SIL Open Font License, Version 1.1.
See [LICENSE](./maurice/data/assets/fonts/MapleMono-NF/LICENSE.txt).
## References
- RexCrazy804's Quickshell [`basic_bar` example](https://github.com/Rexcrazy804/quickshell-examples/)
- SelfMadeSystem's Quickshell [`shader_wallpaper` examaple](https://github.com/SelfMadeSystem/quickshell-examples/)
- [Quickshell docs](https://quickshell.org/docs/v0.3.0/types/)
- [QtQuick docs](https://doc.qt.io/qt-6/qtquick-index.html)
- [matugen-themes](https://github.com/InioX/matugen-themes/)
- [MapleMono NF](https://github.com/subframe7536/maple-font/releases)
