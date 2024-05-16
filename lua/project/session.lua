return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",

    opts = {
      {
        -- Defaults
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
        options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
        pre_save = nil, -- a function to call before saving the session
        save_empty = false, -- don't save if there are no open file buffers
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
