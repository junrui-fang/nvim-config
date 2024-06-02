return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      lsp_references = {
        win = { position = "top", size = 0.17 },
        focus = true,
      },
    },
  },
  keys = { { "<leader>lr", "<cmd>Trouble lsp_references toggle<cr>", desc = "References" } },
}
