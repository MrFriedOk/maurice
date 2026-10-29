--match classes for blur if i do that maybe perchance

--hl.window_rule({ match = { class = "kitty" }, opacity = 0.95, blur = { enabled = true } })

hl.workspace_rule({ workspace = "special:special", gaps_out = 5 })

--stop all windows fromn auto maximizing (╯°□°）╯︵ ┻━┻
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })
