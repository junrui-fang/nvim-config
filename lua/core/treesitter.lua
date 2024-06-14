return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "windwp/nvim-ts-autotag",
      {
        "LiadOz/nvim-dap-repl-highlights",
        dependencies = { "mfussenegger/nvim-dap" },
        opts = {},
      },
    },
    event = "VeryLazy",

    config = function()
      local configs = require("nvim-treesitter.configs")

      ---@diagnostic disable-next-line: missing-fields
      configs.setup({
        ensure_installed = {
          "lua",
          "luadoc",
          "luap",

          "python",
          "ninja",
          "rst",
          "toml",
          "dap_repl",

          "java",
          "sql",

          "c",
          "cpp",
          "cmake",
          "objc",
          "cuda",
          "proto",

          "javascript",
          "html",
          "css",
          "json5",
          "yaml",
          "toml",
          "markdown",
          "markdown_inline",

          "bash",
          "dockerfile",

          "regex",
          "latex",

          "vim",
          "vimdoc",

          "query",
          "elixir",
          "heex",
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },

        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = "<C-s>",
            node_decremental = "<bs>",
          },
        },

        textobjects = {
          select = {
            enable = true,
            lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim

            keymaps = {
              ["aa"] = { query = "@parameter.outer", desc = "around argument" },
              ["ia"] = { query = "@parameter.inner", desc = "inside argument" },
              ["af"] = { query = "@function.outer", desc = "around function " },
              ["if"] = { query = "@function.inner", desc = "inside function " },
              ["ac"] = { query = "@class.outer", desc = "around class" },
              ["ic"] = { query = "@class.inner", desc = "inside class" },

              ["a?"] = { query = "@conditional.outer", desc = "around conditional" },
              ["i?"] = { query = "@conditional.inner", desc = "inside conditional" },
              ["al"] = { query = "@loop.outer", desc = "around loop" },
              ["il"] = { query = "@loop.inner", desc = "inside loop" },

              ["ak"] = { query = "@block.outer", desc = "around block" },
              ["ik"] = { query = "@block.inner", desc = "inside block" },
              ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },

            selection_modes = {
              ["@parameter.outer"] = "v", -- charwise
              ["@function.outer"] = "V", -- linewise
              ["@class.outer"] = "<c-v>", -- blockwise
            },

            -- include_surrounding_whitespace = true,
          },

          move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
              ["]m"] = { query = "@function.outer", desc = "Next function start" },
              ["]]"] = { query = "@class.outer", desc = "Next class start" },
              ["]l"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Next loop" },
              ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
              ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
              ["[l"] = { query = { "@loop.inner", "@loop.outer" }, desc = "Prev loop" },
              ["[s"] = { query = "@scope", query_group = "locals", desc = "Prev scope" },
              ["[z"] = { query = "@fold", query_group = "folds", desc = "Prev fold" },
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
            goto_next = {
              ["]?"] = { query = "@conditional.outer", desc = "Next conditional" },
            },
            goto_previous = {
              ["[?"] = { query = "@conditional.outer", desc = "Prev conditional" },
            },
          },

          swap = {
            enable = true,
            swap_next = {
              [">K"] = { query = "@block.outer", desc = "Swap next block" },
              [">F"] = { query = "@function.outer", desc = "Swap next function" },
              [">A"] = { query = "@parameter.inner", desc = "Swap next argument" },
            },
            swap_previous = {
              ["<K"] = { query = "@block.outer", desc = "Swap previous block" },
              ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
              ["<A"] = { query = "@parameter.inner", desc = "Swap previous argument" },
            },
          },

          -- TODO: https://github.com/nvim-treesitter/nvim-treesitter-textobjects#textobjects-lsp-interop
        },
      })

      -- make the movements repeatable
      local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
      vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
      vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
    end,
  },
}
