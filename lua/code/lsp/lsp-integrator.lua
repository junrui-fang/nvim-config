return {
	"nvimtools/none-ls.nvim",
	enabled = false,

	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.black, -- Python
				null_ls.builtins.formatting.isort, -- Python
				null_ls.builtins.formatting.prettier, -- formatter for many types of files

				null_ls.builtins.completion.spell,
			},
		})
	end,

	keys = {
		{ "<leader>af", vim.lsp.buf.format, desc = "Format" },
	},
}
