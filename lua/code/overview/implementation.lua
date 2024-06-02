return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      lsp_implementations = {
        win = { position = "top", size = 0.17 },
        focus = true,
      },
    },
  },
  keys = { { "<leader>li", "<cmd>Trouble lsp_implementations toggle<cr>", desc = "Implementations" } },
}
