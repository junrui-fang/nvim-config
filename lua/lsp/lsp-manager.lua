return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall" },

		opts = {},

		keys = {
			{ "<leader>ll", "<cmd>Mason<cr>", desc = "Language Servers" },
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",

		opts = {
			ensure_installed = {
				-- Programming
				"lua_ls",
				"ruff_lsp", -- Python
				"jdtls", -- Java
				"clangd", -- C & C++

				-- Markup
				"marksman", -- md
				"html",
				"ltex", -- LaTeX
			},
		},
	},
}
