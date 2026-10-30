--end4's animations

local prod = function(ds)
	return ds * 1.3 --animation scale, larger = slower
end

hl.curve("pop", { type = "bezier", points = { { 0.72, 0 }, { 0.24, 1 } } })
hl.curve("md3_decel", { type = "bezier", points = { { 0.05, 0.7 }, { 0.1, 1 } } })
hl.curve("md3_accel", { type = "bezier", points = { { 0.3, 0 }, { 0.8, 0.15 } } })
hl.curve("menu_decel", { type = "bezier", points = { { 0.1, 1 }, { 0, 1 } } })
hl.curve("menu_accel", { type = "bezier", points = { { 0.38, 0.04 }, { 1, 0.07 } } })

hl.animation({ leaf = "windows", enabled = true, speed = prod(3), bezier = "pop", style = "popin 60%" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = prod(3), bezier = "md3_decel", style = "popin 60%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = prod(3), bezier = "md3_accel", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = true, speed = prod(10), bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = prod(3), bezier = "md3_decel" })
hl.animation({ leaf = "layersIn", enabled = true, speed = prod(3), bezier = "menu_decel", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = prod(1.6), bezier = "menu_accel" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = prod(2), bezier = "menu_decel" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = prod(4.5), bezier = "menu_accel" })
hl.animation({ leaf = "workspaces", enabled = true, speed = prod(2), bezier = "pop", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = prod(3), bezier = "pop", style = "slidevert" })
