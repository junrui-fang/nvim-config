return {
	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-lspconfig.nvim" },
		lazy = true,

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
