local wk = require("which-key")

wk.register({
	["<leader>"] = {
		-- Plugin
		P = { "<cmd>Lazy<cr>", "Plugins" },
		-- Project
		p = {
			name = "Projects",
			s = { name = "Session" },
		},

		-- Buffer
		b = { name = "Buffers" },

		-- Find
		f = { name = "Find" },
		-- Search & Replace
		R = { name = "Replace", mode = { "n", "x" } },

		-- Git
		g = { name = "Git", mode = { "n", "x" } },

		-- LSP
		l = { name = "LSP" },
		-- Code
		a = { name = "Actions", mode = { "n", "x" } },
		d = { name = "Doc" },
		r = { name = "Refactor", mode = { "n", "x" } },
		-- R = { name = "Run Code", mode = { "x" } },

		-- Notification
		n = { name = "Notification" },

		-- Tools
		t = { name = "Tools", mode = { "n", "x" } },

		-- Toggle
		T = { name = "Toggle" },
	},

	-- Tab
	["<leader><tab>"] = { name = "Tabs" },
})
