return {
  -- Turn browser into a Neovim client
  {
    "glacambre/firenvim",
    enabled = false,
    lazy = not vim.g.started_by_firenvim,
    build = function() vim.fn["firenvim#install"](0) end,
  },
}
