-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- coding options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.breakindent = true
-- vim.opt.expandtab = true -- Use spaces instead of tabs

-- editing options
vim.opt.autowrite = true
vim.opt.writebackup = true
vim.opt.undofile = true
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.completeopt = "menu,menuone,noselect"
vim.opt.inccommand = "split" -- preview incremental substitute

-- Opening options
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.splitkeep = "cursor"

-- Search options
vim.opt.ignorecase = true
vim.opt.smartcase = true -- Don't ignore case with capitals

-- UI options
vim.opt.scrolloff = 0
vim.opt.cmdheight = 0 -- 0 for noice.nvim
vim.opt.laststatus = 0 -- disable the status line for lualine
vim.opt.conceallevel = 1 -- enable for VimTex
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false
vim.opt.termguicolors = true -- True color support
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.wrap = false
vim.opt.list = true -- Show some invisible characters
vim.opt.guicursor = "i:block"
vim.g.have_nerd_font = true
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
