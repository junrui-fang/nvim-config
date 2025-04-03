return {
  {
    "SmiteshP/nvim-navic",
    enabled = false,
    dependencies = { "neovim/nvim-lspconfig" },
    lazy = true,
    opts = {
      highlight = true,
      lazy_update_context = false,
      icons = require("utils.icons").kinds,
    },
    config = function(_, opts)
      require("nvim-navic").setup(opts)
      vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
    end,
  },

  -- Highlight uses of the word
  {
    "RRethy/vim-illuminate",
    enabled = false,
    event = "BufReadPost",
  },

  -- Preview definition, implementation, etc.
  {
    "rmagatti/goto-preview",
    dependencies = { "rmagatti/logger.nvim" },
    keys = "gp",
    opts = {
      default_mappings = true,
    },
  },
}
