return {
  {
    "folke/which-key.nvim",
    dependencies = { { "echasnovski/mini.icons", version = false } },
    event = "VeryLazy",

    opts = {
      preset = "modern",
    },

    keys = {
      {
        "<leader>?",
        function() require("which-key").show({ global = false }) end,
        desc = "Buffer Local Keymaps",
      },
    },
  },
}
