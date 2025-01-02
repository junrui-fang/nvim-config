return {
  -- Turn browser into a Neovim client
  {
    "glacambre/firenvim",
    enabled = false,
    lazy = not vim.g.started_by_firenvim,
    build = function() vim.fn["firenvim#install"](0) end,
  },

  -- LeetCode
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    cmd = "Leet",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      lang = "javascript",
      -- image_support = true,
      plugins = { non_standalone = true },
    },
    keys = {
      { "<leader>kk", "<cmd>Leet<cr>", desc = "menu" },
      { "<leader>kq", "<cmd>Leet exit<cr>", desc = "exit" },
      { "<leader>kd", "<cmd>Leet desc<cr>", desc = "description" },
      { "<leader>kr", "<cmd>Leet run<cr>", desc = "run" },
      { "<leader>ks", "<cmd>Leet submit<cr>", desc = "submit" },
      { "<leader>ko", "<cmd>Leet open<cr>", desc = "open" },
      { "<leader>kp", "<cmd>Leet list<cr>", desc = "problems" },
      { "<leader>kl", "<cmd>Leet lang<cr>", desc = "lang" },
      { "<leader>ki", "<cmd>Leet info<cr>", desc = "info" },
      { "<leader>k<tab>", "<cmd>Leet tabs<cr>", desc = "tabs" },
    },
  },
}
