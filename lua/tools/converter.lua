return {
	{
		"vim-pandoc/vim-pandoc",
		dependencies = { "vim-pandoc/vim-pandoc-syntax" },
		lazy = false,

		keys = {
			{ "<leader>td", "<cmd>Pandoc<cr>", desc = "Doc Converter" },
		},
	},
}
