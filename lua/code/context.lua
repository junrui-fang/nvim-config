return {
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
		lazy = true,
	},

	-- Highlight uses of the word
	{
		"RRethy/vim-illuminate",
		event = "BufReadPost",
	},
}
