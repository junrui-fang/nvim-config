return {
	{
		"danymat/neogen",
		dependencies = "nvim-treesitter/nvim-treesitter",

		opts = {
			snippet_engine = "luasnip",
			languages = {
				lua = {
					template = {
						annotation_convention = "ldoc",
					},
				},
			},
		},

		keys = {
			{"<leader>dd", "<cmd>Neogen func<cr>", desc = "Function"},
			{"<leader>dc", "<cmd>Neogen class<cr>", desc = "Class"},
			{"<leader>dt", "<cmd>Neogen type<cr>", desc = "Type"},
			{"<leader>df", "<cmd>Neogen file<cr>", desc = "File"},
		},
	},
}
