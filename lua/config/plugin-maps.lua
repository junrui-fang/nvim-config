local wk = require("which-key")

wk.add({
  -- System
  { "<leader>s", group = "System" },
  { "<leader>st", group = "Toggle" },
  { "<leader>sn", group = "Notification" },
  { "<leader>sp", "<cmd>Lazy<cr>", desc = "Plugins" },
  { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
  { "<leader>sc", ":e ~/.config/nvim/init.lua <CR>", desc = "Config" },
  { "<leader>sR", ":!open https://github.com/junrui-fang/nvim-config<cr>", desc = "Repo" },

  -- Project
  { "<leader>p", group = "Project" },
  { "<leader>ps", group = "Session" },
  { "<leader>pt", group = "Todos" },
  { "<leader>j", group = "Jump" },
  -- Git
  {
    mode = { "n", "v" },
    { "<leader>g", group = "Git" },
    { "<leader>gb", group = "Blame" },
    { "<leader>gh", group = "GitHub" },
    { "<leader>gw", group = "Worktree" },
  },
})

wk.register({
  ["<leader>"] = {

    -- Buffer
    b = { name = "Buffers" },

    -- Find
    f = { name = "Find" },
    -- Search & Replace
    R = { name = "Replace", mode = { "n", "x" } },

    -- LSP
    l = { name = "Lang" }, -- LSP & language specific
    x = { name = "Diagnostic" },
    -- Code
    a = {
      name = "Actions",
      mode = { "n", "x" },
      -- r = { vim.lsp.buf.rename, "Rename" },
    },
    d = { name = "Doc" },
    r = { name = "Refactor", mode = { "n", "x" } },

    -- Tools
    u = { name = "Utils", mode = { "n", "x" } },

    -- UI
    U = { name = "UI" },
  },

  -- Edit
  ["<leader>;"] = {
    name = "Edit",
    mode = { "n", "x" },
    c = { name = "Comment" },
    r = { name = "Replace" },
    n = { "<cmd> ene <BAR> startinsert <cr>", "New file", mode = "n" },
  },

  -- Tab
  ["<leader><tab>"] = { name = "Tabs" },

  -- Code Runner
  ["<leader>."] = { name = "Code Runner", mode = "n" },
  -- Compiler
  ["<leader>-"] = { name = "Compiler", mode = "n" },
  -- Test Runner
  ["<leader>'"] = { name = "Test", mode = "n" },
  -- Task Runner
  ["<leader>>"] = { name = "Task Runner", mode = "n" },
  -- Debugger
  ["<leader>,"] = {
    name = "Debugger",
    mode = { "n", "x" },
    s = { desc = "Debug Selection", mode = "x" },
    f = { name = "Find" },
  },
})
