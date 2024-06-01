return {
  {
    "SmiteshP/nvim-navic",
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
    keys = "gp",
    config = function()
      require("goto-preview").setup({
        default_mappings = true,
      })
    end,
  },
}
