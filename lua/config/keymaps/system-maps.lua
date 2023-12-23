-- <space> does nothing in normal & visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Easier closing & quitting
vim.keymap.set("n", "<leader>q", "<cmd>confirm q<cr>", { desc = "Quit" })
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>", { desc = "Close" })

-- Windows
-- Navigation
-- Editing
-- LSP
