local fileExp = "dolphin"
local launcher = "rofi -show drun"
local terminal = "kitty"
local browser = "firefox"
local office = "libreoffice"
local editor = "nvim"

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%+ -l 1.5"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 2%-"),
	{ locked = true, repeating = true }
)
hl.bind("SUPER + A", hl.dsp.exec_cmd(launcher))

--emoticond by cloveian!! >w<
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("emoticond menu --launcher rofi"))

--screnshot, sry windows users
hl.bind("SUPER + P", hl.dsp.exec_cmd("hyprshot -m region -f $(date '+%Y-%m-%d_%H.%M.%S.png') -o ~/Screenshots"))

--ocr
hl.bind(
	"SUPER + SHIFT + X",
	hl.dsp.exec_cmd(
		qsIsAlive
			.. " || pidof slurp || grim -g \"$(slurp $SLURP_ARGS)\" \"/tmp/ocr_image.png\" && tesseract \"/tmp/ocr_image.png\" stdout -l $(tesseract --list-langs | awk 'NR>1{print $1}' | tr '\\\\n' '+' | sed 's/\\\\+$/\\\\n/') | wl-copy && rm \"/tmp/ocr_image.png\""
	)
)
--color picker, i hardly know'er
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("hyprpicker -a"))

--window ctl with mouse
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:274", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

--focus with arrows
for i = 1, 4 do
	local arrowkey = { "Left", "Right", "Up", "Down" }
	local focusdir = { "l", "r", "u", "d" }
	hl.bind(
		"SUPER + " .. arrowkey[i],
		hl.dsp.focus({ direction = focusdir[i] }),
		{ description = "Window: Focus " .. arrowkey[i] }
	)
end

--move windows with arrows
for i = 1, 4 do
	local arrowkey = { "Left", "Right", "Up", "Down" }
	local focusdir = { "l", "r", "u", "d" }
	hl.bind(
		"SUPER + SHIFT + " .. arrowkey[i],
		hl.dsp.window.move({ direction = focusdir[i] }),
	)
end

hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "close" })

hl.bind("SUPER + CTRL + Equal", hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind("SUPER + CTRL + Minus", hl.dsp.layout("splitratio +0.1"), { repeating = true })

hl.bind("SUPER + SHIFT + T", hl.dsp.window.float({ action = "toggle" }))

hl.bind("SUPER + D", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

--workspace move
for i = 1, 10 do
	hl.bind("SUPER + SHIFT + " .. (i % 10), function()
		hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = true }))
	end)
end

--for keypad
for i = 1, 10 do
	local numpadkey = { 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }
	hl.bind("SUPER + SHIFT + code:" .. numpadkey[i], function()
		hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
	end)
end

hl.bind("SUPER + SHIFT + S", hl.dsp.window.move({ workspace = "special:special", follow = false }))

hl.bind("CTRL + SUPER + S", hl.dsp.workspace.toggle_special("special"))

--workspace switch via number
for i = 1, 10 do
	hl.bind("SUPER + " .. (i % 10), function()
		hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
	end)
end
--j
for i = 1, 10 do
	local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
	hl.bind("SUPER + code:" .. numberkey[i], function()
		hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
	end)
end
for i = 1, 10 do
	local numpadkey = { 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }
	hl.bind("SUPER + code:" .. numpadkey[i], function()
		hl.dispatch(hl.dsp.focus({ workspace = workspace_in_group(i) }))
	end)
end

--focus by arrow
for i = 1, 2 do
	local keys = { "Left", "Right" }
	local prefix = { "r-", "r+" }
	hl.bind("CTRL + SUPER + " .. keys[i], hl.dsp.focus({ workspace = prefix[i] .. "1" }))
end

--special
hl.bind("SUPER + S", hl.dsp.workspace.toggle_special("special"))
--for you middle mouse button-havers
hl.bind("SUPER + mouse:275", hl.dsp.workspace.toggle_special("special"))

--LOOOOOOOOOOOOOOOock sesssion
hl.bind("SUPER + L", hl.dsp.exec_cmd("qs ipc call lock lock"))

--apps
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal))
hl.bind("XF86PerformanceMode", hl.dsp.exec_cmd("~/osu.sh"))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileExp))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + C", hl.dsp.exec_cmd(editor))
hl.bind("SUPER + O", hl.dsp.exec_cmd(office))
