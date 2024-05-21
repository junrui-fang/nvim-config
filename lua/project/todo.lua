return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost" },

    opts = {},

    keys = {
      { "<leader>pt", "<cmd>TodoTrouble<cr>", desc = "Todos" },
    },
  },

  -- TODO: What next?

  -- FIX: this needs fixing
  -- BUG: a bug here
  -- ISSUE: might cause some problem

  -- WARN: still in development
  -- HACK: weird code warning

  -- PERF: slow, need optimization
  -- PERF: fully optimized
  -- OPTIMIZE: use of Fourier transform

  -- NOTE: use of syntactic sugar
  -- INFO: some information (e.g. links)

  -- TEST: this print is for testing
  -- TESTING: the function is under testing
  -- PASSED: the function passed the tests
  -- FAILED: the function failed the tests
}
