return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",

    opts = {
      snippet_engine = "luasnip",
      languages = {
        lua = {
          template = {
            annotation_convention = "ldoc",
          },
        },
        python = {
          template = {
            annotation_convention = "google_docstrings",
          },
        },
      },
    },

    keys = {
      { "<leader>df", "<cmd>Neogen func<cr>", desc = "Function" },
      { "<leader>dc", "<cmd>Neogen class<cr>", desc = "Class" },
      { "<leader>dt", "<cmd>Neogen type<cr>", desc = "Type" },
      { "<leader>dF", "<cmd>Neogen file<cr>", desc = "File" },
    },
  },

  -- DevDocs documentations search
  {
    "luckasRanarison/nvim-devdocs",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      after_open = function(bufnr) vim.api.nvim_buf_set_keymap(bufnr, "n", "q", ":close<CR>", {}) end,
    },

    keys = {
      { "<leader>dd", "<cmd>DevdocsToggle<cr>", desc = "Devdocs Toggle" },
      { "<leader>ds", "<cmd>DevdocsOpenCurrentFloat<cr>", desc = "Devdocs Search" },
      { "<leader>dS", "<cmd>DevdocsOpenFloat<cr>", desc = "Devdocs Search other langs" },
    },
  },

  -- HTML code documentations
  {
    "Zeioth/dooku.nvim",
    cmd = { "DookuGenerate", "DookuOpen", "DookuAutoSetup" },
    opts = {},
  },
}
