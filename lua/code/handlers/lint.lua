return {
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",

    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave" },
      linters_by_ft = {
        markdown = { "markdownlint" },
        html = { "htmlhint" },
      },
    },

    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft

      -- start linter immediately
      lint.try_lint()
      -- then lint on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
}
