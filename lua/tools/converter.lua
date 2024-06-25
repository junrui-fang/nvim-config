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
      save_path = vim.fn.getcwd() .. "/media",
      bg_theme = "default",
      watermark = "watermark here",
      mac_window_bar = false,
    },
    keys = {
      { "<leader>uc", ":'<,'>CodeSnap<cr>", mode = "x", desc = "Copy code snapshot" },
      { "<leader>us", ":'<,'>CodeSnapSave<cr>", mode = "x", desc = "Save code snapshot" },
    },
  },
}
