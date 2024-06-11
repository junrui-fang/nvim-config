return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    opts = { ui = { border = "single" } },
    keys = { { "<leader>lp", "<cmd>Mason<cr>", desc = "Packages" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
  },
}
