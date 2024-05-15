return {
	{
		"akinsho/toggleterm.nvim",
		keys = {
			{
				"<leader>gh",
				function()
					local open_term = require("utils.terminal").open_term
					open_term("gh dash")
				end,
				desc = "Github Dashboard",
			},
		},
	},
}
