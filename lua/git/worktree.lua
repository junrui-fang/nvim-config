return {
	{
		"ThePrimeagen/git-worktree.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		opts = {},
		config = function()
			require("telescope").load_extension("git_worktree")
		end,

		keys = {
			{
				"<leader>gwm",
				function()
					require("telescope").extensions.git_worktree.git_worktrees()
				end,
				desc = "Manage",
			},
			{
				"<leader>gwc",
				function()
					require("telescope").extensions.git_worktree.create_git_worktree()
				end,
				desc = "Create",
			},
		},
	},
}
