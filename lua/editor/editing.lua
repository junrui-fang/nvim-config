return {
  -- Powerful surround manipulation
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    enabled = false,
    opts = {},
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = "VeryLazy",
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "LudoPinelli/comment-box.nvim",
    keys = {
      { "<leader>;cb", "<cmd>CBccbox<cr>", desc = "Box", mode = { "n", "x" } },
      { "<leader>;ct", "<cmd>CBllline<cr>", desc = "Title Line", mode = { "n", "x" } },
      { "<leader>;cl", "<cmd>CBline<cr>", desc = "Simple Line", mode = { "n", "x" } },
      { "<leader>;cm", "<cmd>CBllbox11<cr>", desc = "Marked", mode = { "n", "x" } },
    },
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- Auto-saving
  {
    "okuuva/auto-save.nvim",
    version = "^1.0.0",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      debounce_delay = 400,
    },
    keys = { { "<leader>sta", "<cmd>ASToggle<cr>", desc = "Auto-save" } },
  },
}
