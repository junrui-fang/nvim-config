return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },

    opts = {
      ui = {
        border = "single",
      },
      ensure_installed = {
        "stylua",
      },
    },

    keys = {
      { "<leader>ll", "<cmd>Mason<cr>", desc = "Language Servers" },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
      },
      auto_install = true,
    },
  },
}
