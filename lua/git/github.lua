return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>ghh",
        function()
          local open_term = require("utils.terminal").open_term
          open_term("gh dash")
        end,
        desc = "GitHub Dashboard",
      },
    },
  },

  -- PR and issues
  {
    "pwntester/octo.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Octo",
    opts = {},
    -- TODO: add keymaps
  },
}
