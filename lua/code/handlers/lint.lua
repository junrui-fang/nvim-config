return {
  {
    "mfussenegger/nvim-lint",
    event = "LspAttach",

    opts = {
      events = { "BufWritePost", "BufReadPost", "InsertLeave", "TextChanged" },
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
      vim.api.nvim_create_autocmd(opts.events, {
        group = vim.api.nvim_create_augroup("nvim-lint", { clear = true }),
        callback = function() require("lint").try_lint() end,
      })
    end,
  },
}
