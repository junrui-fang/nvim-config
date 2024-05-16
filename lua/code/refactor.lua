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
        ":Refactor extract ",
        mode = "x",
        desc = "Extract Function",
      },
      {
        "<leader>rf",
        ":Refactor extract_to_file ",
        mode = "x",
        desc = "Extract Function to File",
      },
      {
        "<leader>rv",
        ":Refactor extract_var ",
        mode = "x",
        desc = "Extract Variable",
      },
      {
        "<leader>ri",
        ":Refactor inline_var",
        mode = { "n", "x" },
        desc = "Inline Variable",
      },
      { "<leader>rI", ":Refactor inline_func", desc = "Inline Function" },
      { "<leader>rb", ":Refactor extract_block", desc = "Extract Block" },
      { "<leader>rB", ":Refactor extract_block_to_file", desc = "Extract Block to File" },

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
