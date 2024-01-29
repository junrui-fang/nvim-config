return {
	{
		"stevearc/aerial.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},

		opts = {
			backends = { "treesitter", "lsp", "markdown", "man" },
			attach_mode = "global",
			layout = { min_width = 40 },
			show_guides = true,
			filter_kind = false,
		},

		keys = {
			{ "<leader>lo", "<cmd>AerialToggle!<CR>", desc = "Outline" },
		},
	},
}
