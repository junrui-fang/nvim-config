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
    priority = 1000,
    init = function() vim.cmd.colorscheme("tokyonight-moon") end,
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
    "catppuccin/nvim",
    lazy = true,

    name = "catppuccin",
    priority = 1000,

    opts = {
      transparent_background = true,

      integrations = {
        -- https://github.com/catppuccin/nvim#integrations
        -- https://www.lazyvim.org/plugins/colorscheme#catppuccin

        neotree = false,

        noice = false,
        notify = false,

        which_key = false,

        indent_blankline = { enabled = true },
      },
    },
  },
}
