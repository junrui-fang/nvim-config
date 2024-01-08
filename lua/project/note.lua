return {
	{
		"nvim-neorg/neorg",
		build = ":Neorg sync-parsers",
		dependencies = { "nvim-lua/plenary.nvim" },

		ft = "norg",
		cmd = "Neorg",

		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},

					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/Projects/Note/notes/",
							},
						},
					},
				},
			})
			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,

		keys = {
			{ "<leader>pn", "<cmd>Neorg index<cr>", desc = "Notes" },
		},
	},
}
