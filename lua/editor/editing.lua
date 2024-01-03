return {
	-- Powerful surround manipulation
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",

		opts = {},
	},

	-- Auto-pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
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

	-- Search & Replace
	{
		"nvim-pack/nvim-spectre",
		build = false,

		cmd = "Spectre",

		opts = {
			-- open_cmd = "noswapfile vnew",
		},

		keys = {
			{
				"<leader>rr",
				'<cmd>lua require("spectre").toggle()<cr>',
				desc = "Toggle Spectre",
			},
			{
				"<leader>rw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
				desc = "Search current word",
			},
			{
				"<leader>rw",
				'<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
				mode = "v",
				desc = "Search current word",
			},
			{
				"<leader>rp",
				'<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
				desc = "Search on current file",
			},
		},
	},
}
