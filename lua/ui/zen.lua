return {
  "folke/zen-mode.nvim",
  cmd = "ZenMode",
  opts = { window = { width = function() return math.min(120, vim.o.columns * 0.75) end } },
  keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
}
