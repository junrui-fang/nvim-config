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

	-- Preview definition, implementation, etc.
	{
		"rmagatti/goto-preview",
		keys = "gp",
		config = function()
			require("goto-preview").setup({
				default_mappings = true,
			})
		end,
	},
}
