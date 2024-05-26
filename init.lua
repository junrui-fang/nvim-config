require("config")

-- Install lazy.nvim as the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Load plugins
  spec = {
    { import = "core" },

    { import = "code" },
    { import = "code.lsp" },
    { import = "code.cmp" },
    { import = "code.lang" },
    { import = "code.runners" },
    { import = "code.handlers" },

    { import = "ui" },
    { import = "ui.lines" },

    { import = "git" },
    { import = "tools" },
    { import = "editor" },
    { import = "project" },

    { import = "miscellaneous" },
  },

  -- Setup behaviors of lazy.nvim
  defaults = { lazy = false },
  checker = { enabled = true }, -- automatically check for plugin updates
  install = { missing = true, colorscheme = { "tokyonight" } },
  ui = { border = "single" },

  -- disable some built-in Neovim plugins, for better performance
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

require("config.keymaps.plugin-maps")
