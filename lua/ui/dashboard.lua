local logo = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]]
logo = string.rep("\n", 14) .. logo .. "\n" -- paddings

local buttons = {
  { icon = "  ", desc = "Find File", key = "f", action = "Telescope find_files" },
  { icon = "󱄽  ", desc = "Grep", key = "/", action = "Telescope live_grep" },
  { icon = "  ", desc = "Recent", key = "r", action = "Telescope oldfiles" },
  { icon = "  ", desc = "Session", key = "s", action = [[lua require("persistence").load()]] },
  { icon = "  ", desc = "New File", key = "n", action = "enew | startinsert" },
  { icon = "  ", desc = "Config", key = "c", action = "e ~/.config/nvim/init.lua" },
  { icon = "  ", desc = "Plugins", key = "p", action = "Lazy" },
  { icon = "  ", desc = "Github", key = "g", action = "!open https://github.com/junrui-fang/nvim-config" },
  { icon = "  ", desc = "LeetCode", key = "l", action = "Leet" },
  { icon = "  ", desc = "Quit", key = "q", action = "qa" },
}
for _, button in ipairs(buttons) do
  button.key_format = " %s" -- remove default surrounding `[]`
  button.desc = button.desc .. string.rep(" ", 24) -- paddings
end

local footer = function()
  local stats = require("lazy").stats()
  local plugins = "  " .. stats.loaded .. "/" .. stats.count
  local profile = "  " .. stats.startuptime .. "ms"
  return {
    "", -- padding
    plugins,
    profile,
  }
end

return {
  "nvimdev/dashboard-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = {
    theme = "doom",
    config = {
      header = vim.split(logo, "\n"),
      center = buttons,
      footer = footer,
    },
    hide = {
      statusline = false, -- leave it to lualine
    },
  },

  keys = { { "<leader>sd", "<cmd>Dashboard<cr>", desc = "Dashboard" } },
}
