return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      lsp = {
        win = {
          type = "float",
          border = "rounded",
          size = { width = 0.3, height = 0.3 },
        },
        focus = true,
      },
    },
  },

  keys = { { "<leader>ll", "<cmd>Trouble lsp toggle<cr>", desc = "LSP Info" } },
}
