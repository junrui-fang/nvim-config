local keymap = vim.keymap.set

-- <space> does nothing in normal & visual mode
keymap({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
keymap("n", "<esc>", "<cmd>nohlsearch<cr>")

-- Easier closing & quitting
keymap("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
keymap("n", "<leader>Q", "<cmd>confirm qa<cr>", { desc = "Quit All" })
keymap("n", "<leader>c", "<cmd>bd!<cr>", { desc = "Close" })

-- Windows
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
-- Tabs
keymap("n", "<leader><tab>j", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>k", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other" })
keymap("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- Terminal
keymap("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
keymap("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
keymap("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })

-- Editing
keymap("i", "<C-l>", "<Right>", { desc = "Cursor move right" })
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
keymap("n", "<leader>;F", "gg=G``", { desc = "Format (use =)" })
keymap("n", "<leader>;y", "<cmd>%w !pbcopy<cr>", { desc = "Yank Buffer" })

-- Navigation
keymap("n", "[q", vim.cmd.cprev, { desc = "Previous quickfix" })
keymap("n", "]q", vim.cmd.cnext, { desc = "Next quickfix" })

local diagnostic_goto = function(next, severity)
  local count = next and 1 or -1
  local opts = { count = count, float = true }
  if severity then opts.severity = vim.diagnostic.severity[severity] end
  return function() vim.diagnostic.jump(opts) end
end
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })
keymap("n", "]h", diagnostic_goto(true, "HINT"), { desc = "Next Hint" })
keymap("n", "[h", diagnostic_goto(false, "HINT"), { desc = "Prev Hint" })
