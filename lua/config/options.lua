-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- coding options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- editing options
vim.opt.autowrite = true
vim.opt.writebackup = true

-- UI options
vim.opt.scrolloff = 0
vim.opt.cmdheight = 0 -- 0 for noice.nvim
vim.opt.conceallevel = 1 -- enable for VimTex
vim.opt.wrap = true
vim.opt.list = true -- Show some invisible characters
vim.opt.guicursor = "i:block"
vim.opt.fillchars = {
	eob = " ",
}

-- options to consider in the future
-- vim.opt.wrapmargin = 100
-- vim.opt.foldlevel = 1
-- vim.opt.foldclose = "all"

-- Ensure gx is working
-- vim.cmd("packadd! netrw")
