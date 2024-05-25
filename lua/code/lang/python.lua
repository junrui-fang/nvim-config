return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
              },
            },
          },
        },
        ruff = {},
      },
    },
  },

  {
    "AckslD/swenv.nvim",
    ft = "python",
    config = function()
      require("swenv").setup({
        post_set_venv = function() vim.cmd("LspRestart") end,
      })
    end,
  },
}
