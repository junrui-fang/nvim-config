return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				html = {
					filetypes = {
						"html",
						"javascript",
						"javascriptreact",
						"javascript.jsx",
						"typescript",
						"typescriptreact",
						"typescript.tsx",
					},
				},
				cssls = {},
			},
		},
	},
}
