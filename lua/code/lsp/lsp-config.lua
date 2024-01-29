return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			{ "folke/neodev.nvim",  opts = {} },
			{ "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
		},

		config = function()
			local lspconfig = require("lspconfig")
			local navic = require("nvim-navic")
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end

				-- LSP keymaps
				vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover" })
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Goto Definition" })
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Goto Declaration" })
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Goto Implementation" })
				vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Goto References" })
				vim.keymap.set(
					{ "n", "v" },
					"<leader>aa",
					vim.lsp.buf.code_action,
					{ buffer = bufnr, desc = "Code Actions" }
				)
				vim.keymap.set(
					"n",
					"<leader>ar",
					"<cmd>lua vim.lsp.buf.rename()<cr>",
					{ buffer = bufnr, desc = "Rename" }
				)
			end

			-- Setup language servers
			lspconfig.lua_ls.setup({
				on_attach = on_attach,
			})
			lspconfig.ruff_lsp.setup({ on_attach = on_attach })
			lspconfig.marksman.setup({ on_attach = on_attach })
		end,

		keys = {
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		},
	},
}
