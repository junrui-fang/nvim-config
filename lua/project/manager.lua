return {
	{
		"ahmedkhalf/project.nvim",
		event = "VeryLazy",

		opts = {
			manual_mode = false, -- Auto switch cwd
			silent_chdir = true,
		},

		config = function(_, opts)
			require("project_nvim").setup(opts)
		end,
	},
}
