return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      symbols = {
        win = { position = "left", size = 0.25 },
        focus = true,
      },
    },
  },
  keys = { { "<leader>lo", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols" } },
}
