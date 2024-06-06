return {
  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      use_default_keymaps = false,
    },
    keys = { { "<leader>;j", "<cmd>TSJToggle<cr>", desc = "Toggle Join/Split" } },
  },
}
