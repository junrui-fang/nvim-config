return {
  {
    "mason-org/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    opts = { ui = { border = "single" } },
    keys = { { "<leader>lp", "<cmd>Mason<cr>", desc = "Packages" } },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = true,
  },
}
