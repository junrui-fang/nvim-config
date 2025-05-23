return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      -- UI
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      -- Mason
      "mason-org/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      -- Helper
      {
        "Weissle/persistent-breakpoints.nvim",
        config = function() require("persistent-breakpoints").setup({ load_breakpoints_event = { "BufReadPost" } }) end,
      },
      -- Debuggers
      { "leoluz/nvim-dap-go", opts = {} },
      { "suketa/nvim-dap-ruby", config = true },
    },

    config = function()
      local dap, dapui = require("dap"), require("dapui")
      require("mason-nvim-dap").setup({
        automatic_installation = true,
        handlers = {},
        ensure_installed = {
          "bash",
          "codelldb",
          "php",
          "python",
          "js",
          "javadbg",
          "javatest",
          "delve",
          "haskell",
        },
      })

      -- Dap UI setup
      dapui.setup({
        icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
        controls = {
          icons = {
            pause = "⏸",
            play = "▶",
            step_into = "⏎",
            step_over = "⏭",
            step_out = "⏮",
            step_back = "b",
            run_last = "▶▶",
            terminate = "⏹",
            disconnect = "⏏",
          },
        },
      })

      -- Change breakpoint icons
      vim.api.nvim_set_hl(0, "DapBreak", { fg = "#e51400" })
      vim.api.nvim_set_hl(0, "DapStop", { fg = "#ffcc00" })
      local breakpoint_icons = vim.g.have_nerd_font
          and {
            Breakpoint = "",
            BreakpointCondition = "",
            BreakpointRejected = "",
            LogPoint = "",
            Stopped = "",
          }
        or {
          Breakpoint = "●",
          BreakpointCondition = "⊜",
          BreakpointRejected = "⊘",
          LogPoint = "◆",
          Stopped = "⭔",
        }
      for type, icon in pairs(breakpoint_icons) do
        local tp = "Dap" .. type
        local hl = (type == "Stopped") and "DapStop" or "DapBreak"
        vim.fn.sign_define(tp, { text = icon, texthl = hl, numhl = hl })
      end

      -- Open and close UI automatically
      dap.listeners.after.event_initialized["dapui_config"] = dapui.open
      dap.listeners.before.event_terminated["dapui_config"] = dapui.close
      dap.listeners.before.event_exited["dapui_config"] = dapui.close
    end,

    keys = function()
      local dap, dapui = require("dap"), require("dapui")
      local keys = {
        {
          "<leader>,,",
          "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
          desc = "Toggle Breakpoint",
        },
        {
          "<leader>,<",
          "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
          desc = "Conditional Breakpoint",
        },
        {
          "<leader>,C",
          "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
          desc = "Clear Breakpoints",
        },
        { "<leader>,c", function() dap.continue() end, desc = "Continue" },
        { "<leader>,;", function() dap.run_to_cursor() end, desc = "Run to Cursor" },
        { "<leader>,l", function() dap.run_last() end, desc = "Run Last" },
        { "<leader>,i", function() dap.step_into() end, desc = "Step Into" },
        { "<leader>,o", function() dap.step_out() end, desc = "Step Out" },
        { "<leader>,O", function() dap.step_over() end, desc = "Step Over" },
        { "<leader>,g", function() dap.goto_() end, desc = "Go to Line" },
        { "<leader>,j", function() dap.down() end, desc = "Down" },
        { "<leader>,k", function() dap.up() end, desc = "Up" },
        { "<leader>,p", function() dap.pause() end, desc = "Pause" },
        { "<leader>,r", function() dap.repl.toggle() end, desc = "Toggle REPL" },
        { "<leader>,s", function() dap.session() end, desc = "Session" },
        { "<leader>,t", function() dap.terminate() end, desc = "Terminate" },
        { "<leader>,u", function() dapui.toggle() end, desc = "UI" },
        { "<leader>,w", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
      }
      return keys
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>,fc", "<cmd>Telescope dap commands<cr>", desc = "Commands" },
      { "<leader>,fC", "<cmd>Telescope dap configurations<cr>", desc = "Configurations" },
      { "<leader>,fb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Breakpoints" },
      { "<leader>,fv", "<cmd>Telescope dap variables<cr>", desc = "Variables" },
      { "<leader>,ff", "<cmd>Telescope dap frames<cr>", desc = "Frames" },
    },
  },
}
