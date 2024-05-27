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

      vim.keymap.set("n", "<leader>''", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>'c", dap.continue, { desc = "Continue" })
      vim.keymap.set("n", "<leader>';", dap.run_to_cursor, { desc = "Run to Cursor" })
      vim.keymap.set("n", "<leader>'l", dap.run_last, { desc = "Run Last" })
      vim.keymap.set("n", "<leader>'i", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<leader>'o", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<leader>'O", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<leader>'b", dap.step_back, { desc = "Step Back" })
      vim.keymap.set(
        "n",
        "<leader>'\"",
        function() dap.set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
        { desc = "Set Breakpoint" }
      )
      vim.keymap.set("n", "<leader>'u", dapui.toggle, { desc = "UI" })

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
}
