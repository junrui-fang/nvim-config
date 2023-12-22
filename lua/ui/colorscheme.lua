return {
	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = {
			style = "moon",

			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		},
	},

	{
		"catppuccin/nvim",
		lazy = true,

		name = "catppuccin",
		priority = 1000,

		opts = {
			transparent_background = true,

			integrations = {
				-- https://github.com/catppuccin/nvim#integrations
				-- https://www.lazyvim.org/plugins/colorscheme#catppuccin

				neotree = false,

				noice = false,
				notify = false,

				which_key = false,

				indent_blankline = { enabled = true },
			},
		},
	},
}
