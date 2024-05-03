local wk = require("which-key")

wk.register({
	["<leader>"] = {
		-- System
		s = {
			name = "System",
			c = { ":e ~/.config/nvim/init.lua <CR>", "Config" },
			k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
			n = { name = "Notification" },
			p = { "<cmd>Lazy<cr>", "Plugins" },
			t = { name = "Toggle" },

			R = { ":!open https://github.com/junrui-fang/nvim-config<cr>", "Repo" },
		},

		-- Project
		p = {
			name = "Projects",
			n = { "<cmd> ene <BAR> startinsert <cr>", "New file" },
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

		-- Tools
		t = { name = "Tools", mode = { "n", "x" } },

		-- Toggle
		T = { name = "Toggle" },
	},

	-- Tab
	["<leader><tab>"] = { name = "Tabs" },

	-- Code Runner
	["<leader>."] = { name = "Code Runner", mode = "n" },
})
