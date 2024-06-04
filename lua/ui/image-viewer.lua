return {
  "3rd/image.nvim",
  dependencies = { "luarocks.nvim" },
  ft = { "markdown", "norg" },
  config = function()
    require("image").setup({
      backend = "kitty",
      max_height_window_percentage = 50,
      hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg" },
    })
  end,
}
