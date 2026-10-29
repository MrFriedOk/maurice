return {
	{
		--window management
		"folke/edgy.nvim",
		event = "VeryLazy",
		opts = { require("config.edgyNvim") },
	},

	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},

	{
		{
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			opts = {
				plugins = {
					gitsigns = true,
					tmux = true,
					kitty = { enabled = false, font = "+2" },
				},
			},
			keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
		},

		{
			"MeanderingProgrammer/render-markdown.nvim",
			enabled = false,
		},

		--ui
		{
			"folke/snacks.nvim",
			opts = {
				dashboard = {
					preset = {
						header = [[
					hi
   ]],
					},
				},
				explorer = { enabled = true },
				scroll = { enabled = true },
				notifier = { enabled = true },
				indent = { enabled = true },
				picker = { enabled = true },
			},
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
	},
}
