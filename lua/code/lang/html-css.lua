return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = { init_options = { provideFormatter = false } },
        cssls = { init_options = { provideFormatter = false } },
        emmet_ls = {},
        tailwindcss = {},
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", opts = {} },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}
