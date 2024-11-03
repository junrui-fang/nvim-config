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
  { -- ISSUE: Neovim freeze when using this plugin
    "mistricky/codesnap.nvim",
    build = "make",
    cmd = { "CodeSnap", "CodeSnapSave", "CodeSnapHighlight", "CodeSnapSaveHighlight" },
    opts = {
      save_path = "~/codesnaps",
      mac_window_bar = false,
    },
    keys = {
      { "<leader>uc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      { "<leader>us", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },
}
