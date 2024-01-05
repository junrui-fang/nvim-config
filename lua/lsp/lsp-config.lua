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
			local navic = require("nvim-navic")
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end

			-- Setup language servers
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
			})
			lspconfig.ruff_lsp.setup({})
		end,

		keys = {
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		},
	},
}
