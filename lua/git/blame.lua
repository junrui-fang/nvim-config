return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {},
    keys = { { "<leader>gbb", "<cmd>BlameToggle<cr>", desc = "Blame Panel" } },
  },

  -- Link to blame
  {
    "linrongbin16/gitlinker.nvim",
    keys = {
      { "<leader>gbl", "<cmd>GitLink blame<cr>", mode = { "n", "v" }, desc = "Yank blame link" },
      { "<leader>gbL", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open blame link" },
    },
  },
}
