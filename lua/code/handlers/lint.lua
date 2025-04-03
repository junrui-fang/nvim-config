return {
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
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
      }

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function()
          if vim.opt_local.modifiable:get() then lint.try_lint() end
        end,
      })
    end,
  },
}
