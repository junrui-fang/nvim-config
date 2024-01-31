return {
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh 1",

		config = function()
			require("sniprun").setup({})
		end,

		keys = {
			{ "<leader>.", "<Plug>SnipRun", mode = "x", desc = "Run Code" },
			{ "<leader>..", "<Plug>SnipRun", mode = "n", desc = "Run Code" },
			{ "<leader>.c", "<Plug>SnipClose", mode = "n", desc = "Close" },
			{ "<leader>.s", "<Plug>SnipReset", mode = "n", desc = "Stop" },
			{ "<leader>.r", "<Plug>SnipReplMemoryClean", mode = "n", desc = "Repl Memory Clean" },
		},
	},
}
