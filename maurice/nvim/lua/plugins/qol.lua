return {

	{
		--auto complete
		{
			"saghen/blink.cmp",
			version = "1.*",
			opts = {
				keymap = { preset = "default" },
			},
		},
		{
			--bracket fill
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = { check_ts = true }, --use tree-sitter
		},
	},

	{
		{
			"folke/noice.nvim",
			event = "VeryLazy",
			opts = {},
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
		},
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = {
			formatters_by_ft = { lua = { "stylua" }, python = { "ruff_format" }, rust = { "rustfmt" } },
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		},
	},

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sharkdp/fd",
			"BurntSushi/ripgrep",
			"nvim-telescope/telescope-fzf-native.nvim",
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(buf)
				local gs = require("gitsigns")
				local map = function(lhs, rhs, desc)
					vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
				end
				map("<leader>gp", gs.preview_hunk, "Preview hunk")
				map("<leader>gs", gs.stage_hunk, "Stage hunk")
				map("<leader>gr", gs.reset_hunk, "Reset hunk")
				map("<leader>gb", gs.blame_line, "Blame line")
			end,
		},
	},

	--debug
	{
		"mfusseneggar/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		opts = {},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
}
