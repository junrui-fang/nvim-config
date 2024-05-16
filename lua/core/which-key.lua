return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,

    opts = {
      window = {
        border = "single",
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
  },
}
