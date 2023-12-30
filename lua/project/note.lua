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
								study = "/Users/junruifang/Projects/Note/notes/study/",
								English = "/Users/junruifang/Projects/Note/notes/study/English/",
								Vim = "/Users/junruifang/Projects/Note/notes/study/Vim/",
								Git = "/Users/junruifang/Projects/Note/notes/study/Git/",
								CLI = "/Users/junruifang/Projects/Note/notes/study/CLI/",
								Java = "/Users/junruifang/Projects/Note/notes/study/Java/",
								Python = "/Users/junruifang/Projects/Note/notes/study/Python/",
								HTML = "/Users/junruifang/Projects/Note/notes/Frontend/HTML/",
								CSS = "/Users/junruifang/Projects/Note/notes/Frontend/CSS/",
								work = "/Users/junruifang/Projects/Note/notes/work/",
								Workflow = "/Users/junruifang/Projects/Note/notes/Workflow/",
								auto = "/Users/junruifang/Projects/Note/notes/work/auto",
								life = "/Users/junruifang/Projects/Note/notes/life/",
							},
							default_workspace = "study",
						},
					},
				},
			})
			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
}
