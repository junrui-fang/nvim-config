return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      -- Integrate navi as the cheatsheet
      {
        "<leader>uc",

        function()
          local Terminal = require("toggleterm.terminal").Terminal

          local navi = Terminal:new({
            cmd = "navi",
            hidden = true,
            direction = "float",
            close_on_exit = true,
          })

          navi:toggle()
        end,

        desc = "Cheatsheet",
      },
    },
  },
}
