return {
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>;u", "<cmd>UndotreeToggle<CR>", desc = "Undo Tree" } },
  },

  {
    "debugloop/telescope-undo.nvim",
    dependencies = "nvim-telescope/telescope.nvim",
    keys = { { "<leader>;U", "<cmd>Telescope undo<cr>", desc = "Undo Search" } },
  },
}
