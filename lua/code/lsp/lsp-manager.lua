return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall" },
    opts = { ui = { border = "single" }, ensure_installed = { "stylua" } },
    keys = { { "<leader>lp", "<cmd>Mason<cr>", desc = "Packages" } },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    opts = { ensure_installed = { "lua_ls" }, auto_install = true },
  },
}
