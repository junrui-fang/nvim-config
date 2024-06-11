return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { jdtls = {} },
      setup = { jdtls = function() return true end },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    event = "VeryLazy",
  },
}
