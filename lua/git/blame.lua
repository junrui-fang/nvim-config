return {
  {
    "FabijanZulj/blame.nvim",
    cmd = "BlameToggle",
    opts = {},
    keys = { { "<leader>gbb", "<cmd>BlameToggle<cr>", desc = "Blame" } },
  },

  -- Display blame info as virtual text
  {
    "f-person/git-blame.nvim",
    opts = {
      enabled = false, -- on startup
      schedule_event = "CursorHold", -- better performance
    },
    keys = { { "<leader>gbt", "<cmd>GitBlameToggle<cr>", desc = "Toggle Virtual Text" } },
  },
}
