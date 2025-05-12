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
      { "<leader>gby", "<cmd>GitLink blame<cr>", mode = { "n", "v" }, desc = "Yank blame link" },
      { "<leader>gbo", "<cmd>GitLink! blame<cr>", mode = { "n", "v" }, desc = "Open blame link" },
    },
  },
}
