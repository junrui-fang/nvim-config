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

      -- Compiler
      vim.g.vimtex_compiler_latexmk = {
        aux_dir = ".aux",
        out_dir = ".out",

        -- Defaults
        callback = 1,
        continuous = 1,
        executable = "latexmk",
        hooks = {},

        options = {
          -- Defaults
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }

      -- Returning focus to Neovim after inverse search on macOS
      vim.api.nvim_create_autocmd("User", {
        group = vim.api.nvim_create_augroup("vimtex_event_focus", { clear = true }),
        pattern = "VimtexEventViewReverse",
        callback = function()
          vim.cmd("!open -a kitty")
          vim.cmd("redraw!")
        end,
      })
    end,
    keys = {
      { "<localLeader>l", "", desc = "Vimtex", mode = { "n", "x" } },
    },
  },
}
