return {
  {
    "folke/which-key.nvim",
    dependencies = { { "echasnovski/mini.icons", version = false } },
    event = "VeryLazy",

    opts = {
      window = {
        border = "single",
      },
      layout = {
        align = "center",
      },

      triggers_nowait = {
        -- marks
        -- "`",
        -- "'",
        "g`",
        "g'",

        -- registers
        '"',
        "<c-r>",

        -- spelling
        "z=",
      },
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
