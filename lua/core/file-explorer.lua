return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},

		cmd = "Neotree",

		opts = {
			buffers = { follow_current_file = { enabled = true } },
			filesystem = { follow_current_file = { enabled = true } },
		},

		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
		},
	},
}
