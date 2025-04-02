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
        cond = function() return vim.fn.executable("make") == 1 end,
      },
      "nvim-telescope/telescope-dap.nvim",
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
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
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    },

    config = function(_, opts)
      require("telescope").setup(opts)
      pcall(require("telescope").load_extension, "fzf")
      pcall(require("telescope").load_extension("dap"))
      pcall(require("telescope").load_extension("scope"))
      pcall(require("telescope").load_extension, "undo")
      pcall(require("telescope").load_extension("project"))

      local builtin = require("telescope.builtin")
      local keymap = vim.keymap.set
      -- Grep
      keymap("n", "<leader>//", builtin.live_grep, { desc = "Live Grep" })
      keymap("n", "<leader>/w", builtin.grep_string, { desc = "Current Word" })
      keymap(
        "n",
        "<leader>/b",
        function()
          builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
            winblend = 10,
            previewer = false,
          }))
        end,
        { desc = "in Current Buffer" }
      )
      keymap(
        "n",
        "<leader>/o",
        function()
          builtin.live_grep({
            grep_open_files = true,
            prompt_title = "Live Grep in Open Files",
          })
        end,
        { desc = "in Open Files" }
      )

      -- Find
      keymap("n", "<leader>:", builtin.command_history, { desc = "Command History" })
      keymap("n", "<leader>ff", builtin.find_files, { desc = "Files" })
      keymap("n", "<leader>fr", builtin.oldfiles, { desc = "Recent Files" })
      keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
      keymap("n", "<leader>fm", builtin.man_pages, { desc = "Man Pages" })
      keymap("n", "<leader>fl", builtin.resume, { desc = "Last Search" })
      keymap(
        "n",
        "<leader>fn",
        function() builtin.find_files({ cwd = vim.fn.stdpath("config") }) end,
        { desc = "Neovim Config" }
      )
      -- Git
      keymap("n", "<leader>gB", builtin.git_branches, { desc = "Branches" })
      keymap("n", "<leader>gc", builtin.git_bcommits, { desc = "Buffer Commits" })
      keymap("n", "<leader>gC", builtin.git_commits, { desc = "Commits" })
      keymap("n", "<leader>gs", builtin.git_status, { desc = "Status" })
      keymap("n", "<leader>gS", builtin.git_stash, { desc = "Stash" })
      keymap("n", "<leader>gf", builtin.git_files, { desc = "Files" })
      -- Buffer
      keymap("n", "<leader>bf", builtin.buffers, { desc = "Find Buffers" })
      keymap("n", "<leader>bF", "<cmd>Telescope scope buffers<cr>", { desc = "Find Buffers in Tabs" })
    end,
  },
}
