return {
	-- Enhance UI elements
	{
		"stevearc/dressing.nvim",
		enabled = false,
		-- lazy = true,
		opts = {},

		-- init = function()
		-- 	---@diagnostic disable-next-line: duplicate-set-field
		-- 	vim.ui.select = function(...)
		-- 		require("lazy").load({ plugins = { "dressing.nvim" } })
		-- 		return vim.ui.select(...)
		-- 	end
		-- 	---@diagnostic disable-next-line: duplicate-set-field
		-- 	vim.ui.input = function(...)
		-- 		require("lazy").load({ plugins = { "dressing.nvim" } })
		-- 		return vim.ui.input(...)
		-- 	end
		-- end,
	},

	-- Replace UI for messages, cmdline and popupmenu
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify", -- only needed if use the notification view
		},

		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},

			presets = {
				command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false, -- add a border to hover docs and signature help
			},
		},
	},

	{
		"rcarriga/nvim-notify",
		lazy = true,
		opts = {
			background_colour = "#000000", -- for transparent
		},
	},
}
