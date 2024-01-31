return {
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh 1",
		lazy = false,

		config = function()
			require("sniprun").setup({})
		end,

		keys = {
			{ "<leader>.", "<Plug>SnipRun", mode = "x", desc = "Run Code" },
		},
	},
}
