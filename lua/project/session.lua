return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",

    opts = {
      {
        options = { "buffers", "curdir", "tabpages", "winsize", "globals" },
        pre_save = function() vim.api.nvim_exec_autocmds("User", { pattern = "SessionSavePre" }) end,
      },
    },

    keys = {
      {
        "<leader>pss",
        function() require("persistence").load() end,
        desc = "For current dir",
      },
      {
        "<leader>psl",
        function() require("persistence").load({ last = true }) end,
        desc = "Last",
      },
      {
        "<leader>psd",
        function() require("persistence").stop() end,
        desc = "Stop saving",
      },
    },
  },
}
