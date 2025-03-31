return {
  {
    "nvim-telescope/telescope-project.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = { { "<leader>pp", ":lua require'telescope'.extensions.project.project{}<CR>", desc = "Projects" } },
  },
}
