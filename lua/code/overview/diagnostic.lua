return {
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    opts = {
      open_no_results = true,
      modes = {
        diagnostics = {
          win = { position = "bottom", size = 0.2 },
          focus = true,
        },
      },
    },

    keys = {
      { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
      { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List" },
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace Diagnostics" },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics",
      },
    },
  },

  -- Polish quickfix window
  { "kevinhwang91/nvim-bqf", ft = "qf", opts = {} },
}
