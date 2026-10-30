hl.config({
	general = {
		--gaps (touhou reference)
		gaps_in = 1,
		gaps_out = 1,
		gaps_workspaces = 1,

		border_size = 1,

		col = {
			active_border = "rgba(00000022)",
			inactive_border = "rgba(11111122)",
		},
		resize_on_border = true,

		no_focus_fallback = true,
		allow_tearing = true,
		snap = {
			enabled = true,
			--window_gap = 4,
			--monitor_gap = 5,
			respect_gaps = true,
		},
	},
	decoration = {
		rounding_power = 2,
		rounding = 10,

		shadow = {
			enabled = false,
		},

		blur = {

			enabled = false,
			xray = false,
			special = false,
			new_optimizations = true, --i think needed for xray to work?
			size = 3, --big blur makes less passes look better
			passes = 1,
		},
		--dihm
		dim_inactive = true,
		dim_strength = 0.03,
		dim_special = 0.1,
	},
	animations = {
		enabled = true,
	},
	dwindle = {
		preserve_split = true,
	},
})
