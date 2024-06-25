return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { texlab = {} } },
  },

  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"

      -- Setup pdf-viewer
      vim.g.vimtex_view_method = "skim" -- skim for macos
      vim.g.vimtex_view_skim_sync = 1
      vim.g.vimtex_view_skim_reading_bar = 1
    end,
    keys = {
      { "<localLeader>l", "", desc = "+vimtext" },
    },
  },
}
