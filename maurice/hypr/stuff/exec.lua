hl.on("hyprland.start", function()
	--
	hl.exec_Cmd("gnome-keyring-daemon --start --components=secrets")
	--cursor
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 18")

	--qs
	hl.exec_cmd("qs")
end)
