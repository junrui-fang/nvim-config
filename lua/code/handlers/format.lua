return {
  {
    "stevearc/conform.nvim",
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,

      formatters_by_ft = {
        sh = { "shfmt" },
        go = { "goimports", "gofumpt" },
        lua = { "stylua" },
        php = { "php-cs-fixer" },
        python = { "isort", "black" }, -- can also run multiple formatters sequentially

        javascript = { "prettierd", "prettier", stop_after_first = true }, -- run *until* a formatter is found.
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        less = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },

        markdown = { "prettierd", "prettier", stop_after_first = true, "markdownlint", "markdown-toc" },
        ["markdown.mdx"] = { "prettierd", "prettier", stop_after_first = true, "markdownlint", "markdown-toc" },

        sql = { "sqlfluff" },
        mysql = { "sqlfluff" },
        plsql = { "sqlfluff" },

        -- prettier
        ["vue"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },

      formatters = {
        sqlfluff = { args = { "format", "--dialect=ansi", "-" } },
      },
    },

    keys = {
      {
        "<leader>;f",
        function() require("conform").format({ async = true, lsp_fallback = true }) end,
        desc = "Format buffer",
      },
    },
  },
}
