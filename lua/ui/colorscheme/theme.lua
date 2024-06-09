return {
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    init = function() vim.cmd.colorscheme("neofusion") end,
    opts = {
      transparent_mode = true,
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    enabled = false,
    -- init = function() vim.cmd.colorscheme("onedark_dark") end,
    opts = {
      highlights = {
        Visual = { fg = "${bg}", bg = "${red}" },
        TermCursor = { bg = "${red}" },
        CursorLineNr = { fg = "${blue}" },
        NeoTreeDirectoryIcon = { fg = "${red}" },
        NeoTreeRootName = { fg = "${green}", bold = true },
        WhichKey = { fg = "${red}" },
        WhichKeyFloat = { bg = "${bg}" },
        DashboardHeader = { fg = "${red}" },
        BufferCurrent = { fg = "${blue}" },
        BufferCurrentMod = { fg = "${blue}" },
        BufferAlternate = { fg = "${red}" },
        BufferTabpages = { fg = "${green}" },
        NavicText = { fg = "${red}" },
        NavicSeparator = { fg = "${blue}" },
      },
      options = {
        cursorline = true,
        terminal_colors = true,
        transparency = true,
        lualine_transparency = true,
      },
    },
  },
}
