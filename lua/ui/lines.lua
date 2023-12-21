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
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",

		event = "VeryLazy",

		opts = {
			options = {
				mode = "buffers", -- buffers | tabs

				show_buffer_close_icons = false,
				show_close_icon = false,

				indicator = { style = "none" },
				separator_style = "thick", -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						text_align = "center",
					},
				},

				diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
			},
		},
	},

	-- Indent line
}
