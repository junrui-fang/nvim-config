-- INFO: Advanced Configurations:
-- https://github.com/LazyVim/LazyVim/blob/8346fa7ddc9390312408be571c6443c0b57b9f21/lua/lazyvim/plugins/linting.lua
-- https://github.com/AstroNvim/astrocommunity/blob/d383aaf072bc265d131b0b2c76a6df7055e14c1f/lua/astrocommunity/lsp/nvim-lint/init.lua#L5
return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      events = { "BufEnter", "BufWritePost", "InsertLeave" },
      linters_by_ft = {
        sh = { "shellcheck" },
        php = { "phpcs" },
        cmake = { "cmakelint" },
        -- markdown = { "markdownlint" },
        html = { "htmlhint" },
        ansible = { "ansible_lint" },
        dockerfile = { "hadolint" },
        sql = { "sqlfluff" },
        mysql = { "sqlfluff" },
        plsql = { "sqlfluff" },
      },
    },

    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function() lint.try_lint() end,
      })
    end,
  },
}
