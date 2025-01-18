return { -- preview rename
  "smjonas/inc-rename.nvim",
  opts = {},
  keys = {
    {
      "<leader>ar",
      function() return ":IncRename " .. vim.fn.expand("<cword>") end,
      expr = true,
      desc = "Rename",
    },
  },
}
