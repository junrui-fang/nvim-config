return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    cmd = { "ToggleTerm", "TermExec" },

    opts = {
      open_mapping = [[<c-'>]],
      autochdir = true,
      persist_mode = true,

      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.33
        end
      end,

      float_opts = {
        border = "curved",
      },
    },

    keys = {
      "<C-'>",
      { "<M-1>", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizional Terminal" },
      { "<M-2>", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
      { "<M-3>", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
    },
  },
}
