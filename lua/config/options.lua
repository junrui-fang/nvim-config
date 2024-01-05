-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- coding options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
-- vim.opt.expandtab = true -- Use spaces instead of tabs

-- editing options
vim.opt.autowrite = true
vim.opt.writebackup = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.inccommand = "nosplit" -- preview incremental substitute

-- Search options
vim.opt.smartcase = true -- Don't ignore case with capitals

-- UI options
vim.opt.scrolloff = 0
vim.opt.cmdheight = 0 -- 0 for noice.nvim
vim.opt.conceallevel = 1 -- enable for VimTex
vim.opt.relativenumber = true
vim.opt.termguicolors = true -- True color support
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.wrap = true
vim.opt.list = true -- Show some invisible characters
vim.opt.showmode = false
vim.opt.guicursor = "i:block"
vim.opt.fillchars = {
	eob = " ",
	foldopen = "",
	foldclose = "",
	-- fold = " ",
	-- foldsep = " ",
	-- diff = "╱",
}

-- TODO: folding options

-- options to consider in the future
-- vim.opt.wrapmargin = 100
-- vim.opt.foldlevel = 1
-- vim.opt.foldclose = "all"

-- Ensure gx is working
-- vim.cmd("packadd! netrw")
