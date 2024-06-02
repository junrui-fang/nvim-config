return {
  "folke/trouble.nvim",
  opts = {
    modes = {
      lsp_definitions = {
        win = { position = "top", size = 0.17 },
        focus = true,
      },
      lsp_type_definitions = {
        win = { position = "top", size = 0.17 },
        focus = true,
      },
    },
  },
  keys = {
    { "<leader>ld", "<cmd>Trouble lsp_definitions toggle<cr>", desc = "Definitions" },
    { "<leader>lD", "<cmd>Trouble lsp_type_definitions toggle<cr>", desc = "Type Definitions" },
  },
}
