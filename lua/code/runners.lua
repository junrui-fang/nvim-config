return {
	{
		"michaelb/sniprun",
		branch = "master",
		build = "sh install.sh 1",

		config = function()
			-- https://michaelb.github.io/sniprun/sources/README.html#configuration
			require("sniprun").setup({
				display = {
					"VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
					"LongTempFloatingWindow", --  only for long results. To use with VirtualText[Ok/Err]
					-- "Terminal",                --# display results in a vertical split
					-- "TerminalWithCode",        --# display results and code history in a vertical split
					-- "Api"                      --# return output to a programming interface
				},
			})
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
