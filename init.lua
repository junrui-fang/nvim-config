require("config")

-- Install lazy.nvim as the plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- Setup plugins
require("lazy").setup({
	spec = {
		{ import = "core" },
		{ import = "ui" },
	},
})

require("config.keymaps")

-- colorschemes in ./lua/ui/colorscheme.lua
vim.cmd.colorscheme "catppuccin"
