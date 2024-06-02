return {
  {
    "folke/trouble.nvim",
    opts = {
      icons = {},
      modes = {
        symbols = {
          win = { position = "left", size = 0.14 },
          focus = true,
        },
      },
    },

    keys = {
      {
        "<leader>lo",
        "<cmd>Trouble symbols toggle<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>ll",
        "<cmd>Trouble lsp toggle focus=true win.position=left<cr>",
        desc = "LSP Info",
      },
    },
  },
}
