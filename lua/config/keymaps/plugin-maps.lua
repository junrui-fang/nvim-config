local wk = require("which-key")

wk.register({
  ["<leader>"] = {
    -- System
    s = {
      name = "System",
      c = { ":e ~/.config/nvim/init.lua <CR>", "Config" },
      k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      n = { name = "Notification" },
      p = { "<cmd>Lazy<cr>", "Plugins" },
      t = { name = "Toggle" },

      R = { ":!open https://github.com/junrui-fang/nvim-config<cr>", "Repo" },
    },

    -- Project
    p = {
      name = "Projects",
      s = { name = "Session" },
    },

    -- Buffer
    b = { name = "Buffers" },

    -- Find
    f = { name = "Find" },
    -- Search & Replace
    R = { name = "Replace", mode = { "n", "x" } },

    -- Git
    g = {
      name = "Git",
      mode = { "n", "x" },
      w = { name = "worktree" },
    },

    -- LSP
    l = { name = "Lang" }, -- LSP & language specific
    x = { name = "Diagnostic" },
    -- Code
    a = {
      name = "Actions",
      mode = { "n", "x" },
      r = { vim.lsp.buf.rename, "Rename" },
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
