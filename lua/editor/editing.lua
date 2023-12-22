return {
	-- Powerful surround manipulation
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",

		opts = {},
	},

	-- Auto-saving
	{
		"0x00-ketsu/autosave.nvim",
		event = { "InsertLeave", "TextChanged" },

		opts = {
			prompt_message = "",

			conditions = {
				exists = true,
				modifiable = true,
				filename_is_not = {},
				filetype_is_not = {},
			},
		},
	},
}
