return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",

		cmd = { "ToggleTerm", "TermExec" },

		opts = {
			open_mapping = [[<c-'>]],
			autochdir = true,
			persist_mode = true,

			size = function(term)
				if term.direction == "horizontal" then
					return 15
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.33
				end
			end,

			float_opts = {
				border = "curved",
			},
		},

		keys = {
			"<C-'>",
			{ "<M-1>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizional Terminal" },
			{ "<M-2>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
			{ "<M-3>", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },

			-- lazygit
			{
				"<leader>gg",

				-- https://github.com/LunarVim/LunarVim/blob/b124e8c3e3f8145029c0d9aeb3912e5ac314e0a2/lua/lvim/core/terminal.lua#L149
				function()
					local Terminal = require("toggleterm.terminal").Terminal
					local lazygit = Terminal:new({
						cmd = "lazygit",
						hidden = true,
						direction = "float",
						float_opts = {
							border = "none",
							width = 100000,
							height = 100000,
						},
						on_open = function(_)
							vim.cmd("startinsert!")
						end,
						on_close = function(_) end,
						count = 99,
					})
					lazygit:toggle()
				end,

				desc = "Lazygit",
			},
		},
	},
}
