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

  -- Split and Join
  {
    "echasnovski/mini.splitjoin",
    event = { "BufReadPost", "BufNew" },
    opts = {},
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function() require("nvim-autopairs").setup({}) end,
  },

  -- Auto-saving
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      execution_message = {
        enabled = false,
      },
      debounce_delay = 0,
    },
    keys = { { "<leader>sta", "<cmd>ASToggle<cr>", desc = "Auto-save" } },
  },
}
