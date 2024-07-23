return {
  "3rd/image.nvim",
  dependencies = {
    "vhyrro/luarocks.nvim",
    priority = 1001, -- this plugin needs to run before anything else
    opts = {
      rocks = { "magick" },
    },
  },
  ft = { "markdown", "norg" },
  opts = {
    backend = "kitty",
    max_height_window_percentage = 50,
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.svg", "*.avif" },
  },
}
