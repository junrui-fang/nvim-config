return {
  { "neovim/nvim-lspconfig", opts = { servers = { sqls = {} } } },
  { "nanotee/sqls.nvim", lazy = true },

  { "tpope/vim-dadbod", cmd = "DB" },
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
      "kristijanhusak/vim-dadbod-completion",
    },
    -- event = "VeryLazy",
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
      "DBUIRenameBuffer",
      "DBUILastQueryInfo",
    },

    keys = {
      { "<leader>D", "<cmd>DBUI<cr>", desc = "Database" },
    },
  },
}
