return {
	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},

		event = "VeryLazy",

		opts = {
			options = {
				theme = "auto",
				globalstatus = true,
				disabled_filetypes = {
					statusline = { "alpha" },
					winbar = {},
				},
			},

			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},

			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = { "lazy", "neo-tree" },
		},
	},

	-- Buffer line
	-- Indent line
}
