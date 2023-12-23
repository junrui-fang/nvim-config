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
	ui = { border = "single" },

	spec = {
		{ import = "core" },
		{ import = "ui" },
		{ import = "git" },
		{ import = "project" },
		{ import = "editor" },
	},

	checker = { enabled = true }, -- automatically check for plugin updates
})

require("config.keymaps.plugin-maps")

-- colorschemes in ./lua/ui/colorscheme.lua
vim.cmd.colorscheme("tokyonight")
