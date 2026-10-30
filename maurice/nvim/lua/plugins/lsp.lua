return {
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = { ensure_installed = { "lua_ls", "bashls", "pyright", "rust_analyzer" } },
	},
	{
		"mrcjkb/rustaceanvim",
		version = "^9",
		lazy = false,
	},
	{
		"saecki/crates.nvim",
		event = "BufRead Cargo.toml",
		opts = {},
	},
}
