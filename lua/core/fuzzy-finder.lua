return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },

		cmd = "Telescope",

		keys = {
			-- Grep & Command History
			{ "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
			{ "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },

			-- Find
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
			{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
			{ "<leader>fm", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
			{ "<leader>fl", "<cmd>Telescope resume<cr>", desc = "Last Search" },

			-- Git
			{ "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Branches" },
			{ "<leader>gc", "<cmd>Telescope git_bcommits<cr>", desc = "Buffer Commits" },
			{ "<leader>gC", "<cmd>Telescope git_commits<cr>", desc = "Commits" },
			{ "<leader>gs", "<cmd>Telescope git_status<cr>", desc = "Status" },
			{ "<leader>gS", "<cmd>Telescope git_stash<cr>", desc = "Stash" },
			{ "<leader>gf", "<cmd>Telescope git_files<cr>", desc = "Files" },

			-- LSP
			{ "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Buffer Symbols" },
			{ "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>lD", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },

			-- Buffers
			{ "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
		},
	},
}
