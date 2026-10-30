return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = { ensure_installed = { "lua_ls", "bashls", "pyright" } },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					default_settings = {
						["rust-analyzer"] = {
							check = { command = "clippy" }, -- clippy instead of cargo check
							cargo = { allFeatures = true },
						},
					},
				},
			}
		end,
	},
	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		opts = {},
	},
}
