return {
	-- Powerful surround manipulation
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",

		opts = {},
	},

	-- Comment
	{
		"numToStr/Comment.nvim",
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
		"okuuva/auto-save.nvim",
		cmd = "ASToggle",
		event = { "InsertLeave", "TextChanged" },
		opts = {
			execution_message = {
				enabled = false,
			},
			debounce_delay = 0,
		},
		keys = { { "<leader>ts", "<cmd>ASToggle<cr>", desc = "Auto-save" } },
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
