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

        javascript = { { "prettierd", "prettier" } }, -- run *until* a formatter is found.
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        yaml = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        less = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },

        markdown = { { "prettierd", "prettier" }, "markdownlint", "markdown-toc" },
        ["markdown.mdx"] = { { "prettierd", "prettier" }, "markdownlint", "markdown-toc" },

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
