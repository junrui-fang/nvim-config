-- https://github.com/LunarVim/LunarVim/blob/b124e8c3e3f8145029c0d9aeb3912e5ac314e0a2/lua/lvim/core/terminal.lua#L149
return {
  {
    "akinsho/toggleterm.nvim",
    keys = {
      {
        "<leader>gg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            hidden = true,
            direction = "float",
            float_opts = {
              border = "none",
              width = 100000,
              height = 100000,
            },
            on_open = function(_) vim.cmd("startinsert!") end,
            on_close = function(_) end,
            count = 99,
          })
          lazygit:toggle()
        end,
        desc = "Lazygit",
      },
    },
  },
}
