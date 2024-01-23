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
		R = { name = "Replace", mode = { "n", "v" } },

		-- Git
		g = { name = "Git", mode = { "n", "v" } },

		-- LSP
		l = { name = "LSP" },
		-- Code Action
		a = { name = "Actions", mode = { "n", "v" } },

		-- Notification
		n = { name = "Notification" },

		-- Toggle
		t = { name = "Toggle" },
	},

	-- Tab
	["<leader><tab>"] = { name = "Tabs" },
})
