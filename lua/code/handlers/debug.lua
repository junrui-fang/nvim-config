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
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      -- Debuggers
      -- "leoluz/nvim-dap-go",
    },

    config = function()
      local dap, dapui = require("dap"), require("dapui")

      require("mason-nvim-dap").setup({
        automatic_installation = true,

        handlers = {},

        ensure_installed = {
          "python",
          -- "delve",
        },
      })

      vim.keymap.set("n", "<leader>,,", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>,c", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>,;", dap.run_to_cursor, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<leader>,l", dap.run_last, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>,i", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>,o", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>,O", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>,b", dap.step_back, { desc = "Step Back" })
      vim.keymap.set(
        "n",
        "<leader>,<",
        function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        { desc = "Set Breakpoint" }
      )
      vim.keymap.set("n", "<leader>,u", dapui.toggle, { desc = "UI" })

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

      -- Open and close UI automatically
      dap.listeners.before.attach.dapui_config = function() dapui.open() end
      dap.listeners.before.launch.dapui_config = function() dapui.open() end
      -- dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
      -- dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end

      -- Install golang specific config
      -- require("dap-go").setup()
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

  {
    "Weissle/persistent-breakpoints.nvim",
    event = "BufReadPost",
    config = function()
      require("persistent-breakpoints").setup({
        load_breakpoints_event = { "BufReadPost" },
      })
    end,
    keys = { -- Overwriting nvim-dap's keymaps
      {
        "<leader>,,",
        "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>,<",
        "<cmd>lua require('persistent-breakpoints.api').set_conditional_breakpoint()<cr>",
        desc = "Set Breakpoint",
      },
      {
        "<leader>,C",
        "<cmd>lua require('persistent-breakpoints.api').clear_all_breakpoints()<cr>",
        desc = "Clear Breakpoints",
      },
    },
  },
}
