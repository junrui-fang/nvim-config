return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",

		event = { "VeryLazy" },

		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"python",
					"java",
					"c",
					"lua",

					"javascript",
					"html",
					"markdown",
					"markdown_inline",

					"bash",

					"regex",

					"vim",
					"vimdoc",

					"query",
					"elixir",
					"heex",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
}
