return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        html = {
          init_options = { provideFormatter = false },
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
        },
        cssls = { init_options = { provideFormatter = false } },
        emmet_ls = {},
      },
    },
  },
}
