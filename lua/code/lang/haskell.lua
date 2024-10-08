local haskell_ft = { "haskell", "lhaskell", "cabal", "cabalproject" }

return {
  {
    "mrcjkb/haskell-tools.nvim",
    version = "^3",
    ft = haskell_ft,
    dependencies = {
      { "nvim-telescope/telescope.nvim", optional = true },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then telescope.load_extension("ht") end
    end,
  },

  {
    "mrcjkb/haskell-snippets.nvim",
    dependencies = "L3MON4D3/LuaSnip",
    ft = haskell_ft,
    config = function()
      local haskell_snippets = require("haskell-snippets").all
      require("luasnip").add_snippets("haskell", haskell_snippets, { key = "haskell" })
    end,
  },

  {
    "luc-tielen/telescope_hoogle",
    ft = haskell_ft,
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      local ok, telescope = pcall(require, "telescope")
      if ok then telescope.load_extension("hoogle") end
    end,
  },
}
