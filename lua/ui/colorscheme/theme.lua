return {
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    init = function()
      vim.o.background = "dark"
      vim.cmd([[ colorscheme neofusion ]])
      vim.cmd([[
				highlight! link BufferTabpageFill Normalize
				highlight! link BufferInactive Normalize
			]])
    end,
    opts = {
      transparent_mode = true,
      overrides = {
        DashboardHeader = { fg = "#fd5e3a" },
        DashboardFooter = { fg = "#fd5e3a" },
        DashboardIcon = { fg = "#35b5ff" },
        DashboardDesc = { fg = "#35b5ff" },
        DashboardKey = { fg = "#35b5ff" },
        BufferCurrent = { fg = "#fd5e3a" },
        BufferAlternate = { fg = "#35b5ff" },
        BufferCurrentSign = { ctermbg = "black", fg = "#fd5e3a" },
        BufferAlternateSign = { ctermbg = "black", fg = "#fd5e3a" },
        BufferInactiveSign = { ctermbg = "black", fg = "#fd5e3a" },
        BufferVisibleSign = { ctermbg = "black", fg = "#fd5e3a" },
        NeoTreeDirectoryIcon = { fg = "#fd5e3a" },
        NeoTreeRootName = { fg = "#35b5ff", bold = true },
        -- "#66def9",
        -- "#fa7a61",
        -- "#fc9487",
        -- "#722529",
        -- "#ec30ac",
        -- "#5f6e29",
        -- "#98971a",
        -- "#e8e5b5",
      },
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    enabled = false,
    -- priority = 1000,
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
