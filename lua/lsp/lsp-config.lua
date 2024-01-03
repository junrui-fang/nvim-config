return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim", opts = {} },
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		},

		config = function()
			local lspconfig = require("lspconfig")

			-- Setup language servers
			lspconfig.lua_ls.setup({})
			lspconfig.ruff_lsp.setup({})
		end,

		keys = {
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		},
	},
}
