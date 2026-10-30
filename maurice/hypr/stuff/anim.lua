--literally does nothing here, idk why i kept it
local prod = function(ds)
	return ds * 1 --animation scale, larger = slower
end

local popin = "popin 95%"
local s = 3

--i think a bit easier on the eyes?
hl.curve("easeInOut", { type = "bezier", points = { { 0.65, 0 }, { 0.35, 1 } } })
hl.curve("easeOut", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeOutQuad", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = prod(3), bezier = "easeOut", style = popin })
hl.animation({ leaf = "windowsIn", enabled = true, speed = prod(3), bezier = "easeOut", style = popin })
hl.animation({ leaf = "windowsOut", enabled = true, speed = prod(3), bezier = "easeOut", style = popin })
hl.animation({ leaf = "border", enabled = true, speed = prod(1), bezier = "default" }) --idk what 'deafult' is. also dont know what 'border' leaf is
hl.animation({ leaf = "fade", enabled = true, speed = prod(1.5), bezier = "linear" })
hl.animation({ leaf = "layersIn", enabled = true, speed = prod(3), bezier = "easeOut", style = "slide" })
hl.animation({ leaf = "layersOut", enabled = true, speed = prod(1.6), bezier = "easeOut" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = prod(2), bezier = "linear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = prod(4.5), bezier = "linear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = prod(s), bezier = "easeOut", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = prod(s), bezier = "easeOut", style = "slidevert" })
