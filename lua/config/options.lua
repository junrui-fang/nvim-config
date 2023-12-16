-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.scrolloff = 0
vim.opt.writebackup = true
vim.opt.wrap = true
vim.opt.guicursor = "i:block"
vim.opt.cmdheight = 0 -- 0 for noice.nvim
vim.opt.conceallevel = 1 -- enable for VimTex
-- vim.opt.wrapmargin = 100
-- vim.opt.foldlevel = 1
-- vim.opt.foldclose = "all"

vim.opt.fillchars = {
	eob = " ",
}
-- Ensure gx is working
-- vim.cmd("packadd! netrw")
