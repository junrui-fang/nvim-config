return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sC",
        function() require("telescope.builtin").colorscheme({ enable_preview = true }) end,
        desc = "Colorscheme",
      },
    },
  },

  -- Highlight colors, eg: #eb6f92 rgb(166 227 161)
  { -- Alternative: nvim-highlight-colors
    "uga-rosa/ccc.nvim",
    event = { "BufReadPost", "InsertEnter" },
    cmd = { "CccPick", "CccConvert", "CccHighlighterEnable", "CccHighlighterDisable", "CccHighlighterToggle" },

    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
    config = function(_, opts) require("ccc").setup(opts) end,

    keys = {
      { "<leader>Uh", "<cmd>CccHighlighterToggle<cr>", desc = "Highlight Colors" },
      { "<leader>Up", "<cmd>CccPick<cr>", desc = "Pick Color" },
      { "<leader>Uc", "<cmd>CccConvert<cr>", desc = "Convert Color" },
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    -- init = function() vim.cmd.colorscheme("tokyonight-moon") end,
    opts = {
      style = "moon",
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000,
    init = function() vim.cmd.colorscheme("onedark_dark") end,
    opts = {
      highlights = {
        Visual = { fg = "${bg}", bg = "${red}" },
        TermCursor = { bg = "${red}" },
        NeoTreeDirectoryIcon = { fg = "${red}" },
        NeoTreeRootName = { fg = "${green}", bold = true },
        WhichKey = { fg = "${red}" },
        WhichKeyFloat = { bg = "${bg}" },
        DashboardHeader = { fg = "${red}" },
        BufferCurrent = { fg = "${red}" },
        BufferCurrentMod = { fg = "${red}" },
        BufferAlternate = { fg = "${blue}" },
        BufferTabpages = { fg = "${green}" },
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
