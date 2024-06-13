return {
  { "neovim/nvim-lspconfig", opts = { servers = { sqls = {} } } },
  { "nanotee/sqls.nvim", lazy = true },

  { "tpope/vim-dadbod" },
  {
    "kristijanhusak/vim-dadbod-completion",
    dependencies = "vim-dadbod",
    ft = { "sql", "mysql", "plsql" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "sql", "mysql", "plsql" },
        callback = function()
          local cmp = require("cmp")
          local sources = vim.tbl_map(function(source) return { name = source.name } end, cmp.get_config().sources)
          -- add vim-dadbod-completion source
          table.insert(sources, { name = "vim-dadbod-completion" })
          -- update sources for the current buffer
          cmp.setup.buffer({ sources = sources })
        end,
      })
    end,
  },

  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = "vim-dadbod",
    cmd = {
      "DBUI",
      "DBUIToggle",
      "DBUIAddConnection",
      "DBUIFindBuffer",
      "DBUIRenameBuffer",
      "DBUILastQueryInfo",
    },
    keys = { { "<leader>D", "<cmd>DBUI<cr>", desc = "Database" } },

    init = function()
      vim.g.db_ui_auto_execute_table_helpers = 1
      vim.g.db_ui_show_database_icon = true
      vim.g.db_ui_use_nerd_fonts = true
      vim.g.db_ui_use_nvim_notify = true
    end,
  },
}
