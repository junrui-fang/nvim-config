return {
  "3rd/image.nvim",
  dependencies = { "vhyrro/luarocks.nvim", opts = { rocks = { "magick" } } },
  ft = { "markdown", "norg" },
  opts = {
    backend = "kitty",
    max_height_window_percentage = 50,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg", "*.avif" },
  },
}
