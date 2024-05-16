return {
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",

    opts = {
      manual_mode = false, -- Auto switch cwd
      silent_chdir = true,
      ignore_lsp = { "lua_ls" },
    },

    config = function(_, opts) require("project_nvim").setup(opts) end,

    keys = {
      { "<leader>pf", "<cmd>Telescope projects<cr>", desc = "Find Projects" },
    },
  },
}
