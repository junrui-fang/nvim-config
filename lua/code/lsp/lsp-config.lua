return {
	{
		"neovim/nvim-lspconfig",
		lazy = true,

		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- { "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},

		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- keymaps
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
					end

					map("K", vim.lsp.buf.hover, "Hover Documentation")
					map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
					map("gD", vim.lsp.buf.declaration, "Goto Declaration")
					map("gr", require("telescope.builtin").lsp_references, "Goto References")
					map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
					map("gy", require("telescope.builtin").lsp_type_definitions, "Type Definition")

					map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Buffer Symbols")
					map("<leader>lS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

					map("<leader>ar", vim.lsp.buf.rename, "Rename")
					map("<leader>aa", vim.lsp.buf.code_action, "Code Action")
				end,
			})

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
			lspconfig.ruff_lsp.setup({ on_attach = on_attach })
			lspconfig.marksman.setup({ on_attach = on_attach })
		end,

		keys = {
			{ "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
		},
	},
}
