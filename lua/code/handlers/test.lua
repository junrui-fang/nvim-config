return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {
      adapters = {},
      status = { virtual_text = true },
      output = { open_on_run = true },
    },

    config = function(_, opts) require("neotest").setup(opts) end,

    keys = {
      { "<leader>''", function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run File" },
      { "<leader>'\"", function() require("neotest").run.run(vim.uv.cwd()) end, desc = "Run All Test Files" },
      { "<leader>'r", function() require("neotest").run.run() end, desc = "Run Nearest" },
      { "<leader>'l", function() require("neotest").run.run_last() end, desc = "Run Last" },
      { "<leader>'s", function() require("neotest").summary.toggle() end, desc = "Toggle Summary" },
      {
        "<leader>'o",
        function() require("neotest").output.open({ enter = true, auto_close = true }) end,
        desc = "Show Output",
      },
      { "<leader>'O", function() require("neotest").output_panel.toggle() end, desc = "Toggle Output Panel" },
      { "<leader>'S", function() require("neotest").run.stop() end, desc = "Stop" },
    },
  },
}
