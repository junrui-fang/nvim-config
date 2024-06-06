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
}
