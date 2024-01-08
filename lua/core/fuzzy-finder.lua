return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				config = function()
					require("telescope").load_extension("fzf")
				end,
			},
		},

		cmd = "Telescope",

		opts = {
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<C-n>"] = "cycle_history_next",
						["<C-p>"] = "cycle_history_prev",
					},
				},
			},
		},

		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("projects")
		end,

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

	-- {
	-- 	"nvim-telescope/telescope-ui-select.nvim",
	-- 	config = function()
	-- 		-- This is your opts table
	-- 		require("telescope").setup({
	-- 			extensions = {
	-- 				["ui-select"] = {
	-- 					require("telescope.themes").get_dropdown({
	-- 						-- even more opts
	-- 					}),

	-- 					-- pseudo code / specification for writing custom displays, like the one
	-- 					-- for "codeactions"
	-- 					-- specific_opts = {
	-- 					--   [kind] = {
	-- 					--     make_indexed = function(items) -> indexed_items, width,
	-- 					--     make_displayer = function(widths) -> displayer
	-- 					--     make_display = function(displayer) -> function(e)
	-- 					--     make_ordinal = function(e) -> string
	-- 					--   },
	-- 					--   -- for example to disable the custom builtin "codeactions" display
	-- 					--      do the following
	-- 					--   codeactions = false,
	-- 					-- }
	-- 				},
	-- 			},
	-- 		})
	-- 		-- To get ui-select loaded and working with telescope, you need to call
	-- 		-- load_extension, somewhere after setup function:
	-- 		require("telescope").load_extension("ui-select")
	-- 	end,
	-- },
}
