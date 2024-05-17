return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqls = {},
      },
    },
  },

  -- language specific tooling
  {
    "nanotee/sqls.nvim",
    lazy = true,
  },
}
