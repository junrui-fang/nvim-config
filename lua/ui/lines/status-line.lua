return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    event = "VeryLazy",
    opts = function()
      local custom_theme = require("neofusion.lualine")
      local opts = {
        options = {
          theme = custom_theme,
          section_separators = "",
          -- component_separators = "",
          globalstatus = true,
          disabled_filetypes = {
            statusline = { "dashboard" },
            winbar = {},
          },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "diff", "diagnostics" },
          lualine_x = {
            "filetype",
            {
              "swenv",
              icon = "📦",
              cond = function() return vim.bo.filetype == "python" end,
            },
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        inactive_sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { "diff", "diagnostics" },
          lualine_x = { "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = { "lazy", "neo-tree" },
      }
      return opts
    end,
  },
}
