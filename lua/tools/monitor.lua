return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      -- Integrate Bottom as the system monitor
      {
        "<leader>um",

        function()
          local Terminal = require("toggleterm.terminal").Terminal

          local bottom = Terminal:new({
            cmd = "btm",
            hidden = true,
            direction = "float",
            close_on_exit = true,
          })
          bottom:toggle()
        end,

        desc = "Monitor",
      },
    },
  },
}
