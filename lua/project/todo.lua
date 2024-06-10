return {
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {},
    keys = {
      { "<leader>ptt", "<cmd>Trouble todo filter = {tag = {TODO}} focus=true<cr>", desc = "TODO" },
      { "<leader>ptn", "<cmd>Trouble todo filter = {tag = {NOTE}} focus=true<cr>", desc = "NOTE" },
      { "<leader>ptf", "<cmd>Trouble todo filter = {tag = {FIX}} focus=true<cr>", desc = "FIX" },
      { "<leader>ptw", "<cmd>Trouble todo filter = {tag = {WARN}} focus=true<cr>", desc = "WARN" },
      { "<leader>pth", "<cmd>Trouble todo filter = {tag = {HACK}} focus=true<cr>", desc = "HACK" },
      { "<leader>ptp", "<cmd>Trouble todo filter = {tag = {PERF}} focus=true<cr>", desc = "PERF" },
      { "<leader>ptT", "<cmd>Trouble todo filter = {tag = {TEST}} focus=true<cr>", desc = "TEST" },
    },
  },

  -- TODO: What next?

  -- FIX: this should be fixed
  -- BUG: a bug here
  -- ISSUE: might cause some problem

  -- WARN: still in development
  -- HACK: weird code warning

  -- PERF: fully optimized
  -- OPTIMIZE: use of Fourier transform
  -- PERFORMANCE: slow, need optimization

  -- NOTE: use of syntactic sugar
  -- INFO: some information (e.g. links)

  -- TEST: this print is for testing
  -- TESTING: the function is under testing
  -- PASSED: the function passed the tests
  -- FAILED: the function failed the tests
}
