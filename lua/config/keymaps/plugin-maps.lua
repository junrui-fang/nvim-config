local wk = require("which-key")

wk.register({
	-- Plugin
	["<leader>p"] = { "<cmd>Lazy<cr>", "Plugins" },

	-- Buffer
	["<leader>b"] = { name = "Buffers" },

	-- Find
	["<leader>f"] = { name = "Find" },

	-- Git
	["<leader>g"] = { name = "Git" },

	-- LSP
	["<leader>l"] = { name = "LSP" },

	-- Notification
	["<leader>n"] = { name = "Notification" },
})

-- Terminal
-- Package Management
-- Git
