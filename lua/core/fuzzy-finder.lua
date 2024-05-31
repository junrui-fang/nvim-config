return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-telescope/telescope-dap.nvim",
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
          n = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true, -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true, -- override the file sorter
          case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
        -- ["ui-select"] = {
        -- 	require("telescope.themes").get_dropdown(),
        -- },
      },
    },

    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension("dap"))
      -- pcall(require("telescope").load_extension, "ui-select")
      -- require("telescope").load_extension("projects")
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
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Buffer Diagnostics" },
      { "<leader>lD", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      -- Debug
      { "<leader>'fc", "<cmd>Telescope dap commands<cr>", desc = "Commands" },
      { "<leader>'fC", "<cmd>Telescope dap configurations<cr>", desc = "Configurations" },
      { "<leader>'fb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Breakpoints" },
      { "<leader>'fv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
      { "<leader>'ff", "<cmd>Telescope dap frames<cr>", desc = "Frames" },

      -- Buffers
      { "<leader>bf", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },
    },
  },
}
