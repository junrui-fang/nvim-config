return {
  "sindrets/diffview.nvim",
  cmd = "DiffviewOpen",
  opts = {
    view = {
      default = { winbar_info = true },
      file_history = { winbar_info = true },
    },
  },
  -- keys = {
  --   { "<leader>gdd", "<cmd>DiffviewOpen<cr>", desc = "Against index" },
  --   { "<leader>gdD", "<cmd>DiffviewOpen HEAD<cr>", desc = "Against last commit" },
  -- },
}
