return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-python",
      "nvim-neotest/neotest-go",
      "olimorris/neotest-rspec",
      { "nvim-neotest/neotest-jest", config = function() end },
      -- "mrcjkb/neotest-haskell",
    },

    opts = {
      adapters = {
        ["neotest-python"] = {},
        ["neotest-rspec"] = {}, -- ruby
        ["neotest-go"] = { recursive_run = true },
        ["neotest-haskell"] = {},
        ["neotest-jest"] = {
          jestCommand = "npm test --",
          jestConfigFile = "custom.jest.config.ts",
          env = { CI = true },
          cwd = function(path) return vim.fn.getcwd() end,
        },
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
    },

    config = function(_, opts)
      -- table.insert(opts.adapters, require("neotest-python"))
      require("neotest").setup(opts)
    end,

    keys = {
      { "<leader>''", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      {
        "<leader>'\"",
        function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
        desc = "Run File DAP",
      },
      { "<leader>'a", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
      { "<leader>'r", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>'R", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Run Nearest DAP" },
      { "<leader>'l", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>'s", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      {
        "<leader>'o",
        function() require("neotest").output.open({ enter = true, auto_close = true }) end,
        desc = "Show Output",
      },
      { "<leader>'O", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>'S", function() require("neotest").run.stop() end, desc = "Stop" },
      { "<leader>'w", function() require("neotest").watch.toggle(vim.fn.expand("%")) end, desc = "Toggle Watch" },
    },
  },
}
