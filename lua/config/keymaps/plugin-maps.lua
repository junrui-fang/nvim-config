local wk = require("which-key")

wk.register({
	["<leader>"] = {
		-- Plugin
		p = { "<cmd>Lazy<cr>", "Plugins" },

		-- Buffer
		b = { name = "Buffers" },

		-- Find
		f = { name = "Find" },
		-- Search & Replace
		r = { name = "Replace", mode = { "n", "v" } },

		-- Git
		g = { name = "Git" },

		-- LSP
		l = { name = "LSP" },

		-- Notification
		n = { name = "Notification" },
	},

	-- Tab
	["<leader><tab>"] = { name = "Tabs" },
})
