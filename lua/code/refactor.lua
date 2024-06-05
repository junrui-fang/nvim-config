return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function() require("refactoring").setup() end,
    keys = {
      {
        "<leader>re",
        function() require("refactoring").refactor("Extract Function") end,
        mode = "x",
        desc = "Extract Function",
      },
      {
        "<leader>rf",
        function() require("refactoring").refactor("Extract Function To File") end,
        mode = "x",
        desc = "Extract Function to File",
      },
      {
        "<leader>rv",
        function() require("refactoring").refactor("Extract Variable") end,
        mode = "x",
        desc = "Extract Variable",
      },
      {
        "<leader>ri",
        function() require("refactoring").refactor("Inline Variable") end,
        mode = { "n", "x" },
        desc = "Inline Variable",
      },
      {
        "<leader>rI",
        function() require("refactoring").refactor("Inline Function") end,
        desc = "Inline Function",
      },
      {
        "<leader>rb",
        function() require("refactoring").refactor("Extract Block") end,
        desc = "Extract Block",
      },
      {
        "<leader>rB",
        function() require("refactoring").refactor("Extract Block To File") end,
        desc = "Extract Block to File",
      },

      -- Debug
      {
        "<leader>rp",
        function() require("refactoring").debug.printf({ below = false }) end,
        desc = "Debug Print",
      },
      {
        "<leader>rV",
        function() require("refactoring").debug.print_var() end,
        mode = { "n", "x" },
        desc = "Debug Print Var",
      },
      {
        "<leader>rc",
        function() require("refactoring").debug.cleanup({}) end,
        desc = "Cleanup Debug Printings",
      },
    },
  },
}
