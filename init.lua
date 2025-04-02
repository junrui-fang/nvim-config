-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Settings that should come before loading lazy.nvim
require("config.options")

-- Setup lazy.nvim & load plugins
require("lazy").setup({
  spec = {
    { import = "core" },

    { import = "code" },
    { import = "code.lsp" },
    { import = "code.cmp" },
    { import = "code.lang" },
    { import = "code.runners" },
    { import = "code.handlers" },
    { import = "code.overview" },

    { import = "ui" },
    { import = "ui.lines" },
    { import = "ui.colorscheme" },

    { import = "git" },
    { import = "tools" },
    { import = "editor" },
    { import = "project" },

    { import = "miscellaneous" },
    { import = "integration" },
  },

  -- Setup behaviors of lazy.nvim
  checker = { enabled = true }, -- automatically check for plugin updates
  install = { missing = true, colorscheme = { "neofusion" } },
  ui = { border = "single" },
  rocks = { enabled = true },

  -- disable some built-in Neovim plugins, for better performance
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "zipPlugin",
        -- "tutor",
        -- "matchit",
        -- "matchparen",
      },
    },
  },
})

require("config.keymap")
require("config.autocmds")
