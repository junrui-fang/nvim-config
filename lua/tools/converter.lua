return {
  {
    "vim-pandoc/vim-pandoc",
    dependencies = { "vim-pandoc/vim-pandoc-syntax" },
    enabled = false,

    keys = {
      { "<leader>ud", "<cmd>Pandoc<cr>", desc = "Doc Converter" },
    },
  },

  -- Code snippet to image
  {
    "krivahtoo/silicon.nvim",
    build = "./install.sh",

    config = function()
      require("silicon").setup({
        font = "FantasqueSansMono Nerd Font=16",
        theme = "Monokai Extended",
      })
    end,

    keys = {
      { "<leader>ui", mode = "x", ":Silicon ", desc = "Image of code" },
    },
  },
}
