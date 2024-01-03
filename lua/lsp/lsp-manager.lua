return {
	{
		"williamboman/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUninstall" },

		opts = {
			ui = {
				border = "single",
			},
		},

		keys = {
			{ "<leader>ll", "<cmd>Mason<cr>", desc = "Language Servers" },
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = { "BufReadPre" },

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
			auto_install = true,
		},
	},
}
