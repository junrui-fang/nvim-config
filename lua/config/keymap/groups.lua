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
  -- Package
  { "<leader>P", group = "Package" },
  -- Git
  {
    mode = { "n", "v" },
    { "<leader>g", group = "Git" },
    { "<leader>gb", group = "Blame" },
    { "<leader>gh", group = "GitHub" },
    { "<leader>gw", group = "Worktree" },
  },

  -- Edit
  {
    mode = { "n", "v" },
    { "<leader>;", group = "Edit" },
    { "<leader>;c", group = "Comment" },
    { "<leader>;r", group = "Replace" },
    { "<leader>;n", "<cmd> ene <BAR> startinsert <cr>", desc = "New file", mode = "n" },
  },

  -- LSP
  { "<leader>l", group = "Lang" },
  { "<leader>lt", group = "Type Checking" },
  { "<leader>x", group = "Diagnostic" },
  -- Code Actions
  { "<leader>a", group = "Actions", mode = { "n", "v" } },
  { "<leader>r", group = "Refactor", mode = { "n", "v" } },
  -- Document
  { "<leader>d", group = "Doc" },

  -- Compile
  { "<leader>-", group = "Compile" },
  -- Run
  { "<leader>.", group = "Run" },
  -- Test
  { "<leader>'", group = "Test" },
  -- Debug
  { "<leader>,", group = "Debug", mode = { "n", "v" } },
  { "<leader>,f", group = "Find" },
  { "<leader>,s", desc = "Debug Selection", mode = "v" },
  -- Task
  { "<leader>>", group = "Task" },

  -- Buffer & Tab
  { "<leader>b", group = "Buffer" },
  { "<leader><tab>", group = "Tab" },

  -- Finding
  { "<leader>f", group = "Find" },
  -- Utility
  { "<leader>u", group = "Utils", mode = { "n", "v" } },
  -- UI
  { "<leader>U", group = "UI" },

  -- LeetCode
  { "<leader>k", group = "LeetCode" },
})
