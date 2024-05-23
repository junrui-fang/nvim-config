return {
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerOpen",
      "OverseerClose",
      "OverseerToggle",
      "OverseerSaveBundle",
      "OverseerLoadBundle",
      "OverseerDeleteBundle",
      "OverseerRunCmd",
      "OverseerRun",
      "OverseerInfo",
      "OverseerBuild",
      "OverseerQuickAction",
      "OverseerTaskAction ",
      "OverseerClearCache",
    },

    opts = {
      task_list = {
        direction = "bottom",
        max_height = { 50, 0.37 },
        min_height = 8,
      },
    },

    keys = {
      { "<leader>>>", "<cmd>OverseerToggle<cr>", desc = "Toggle" },
      { "<leader>>r", "<cmd>OverseerRun<cr>", desc = "Run Task" },
      { "<leader>>c", "<cmd>OverseerRunCmd<cr>", desc = "Run Command" },
      { "<leader>>a", "<cmd>OverseerTaskAction<cr>", desc = "Task Action" },
      { "<leader>>q", "<cmd>OverseerQuickAction<cr>", desc = "Quick Action" },
      { "<leader>>i", "<cmd>OverseerInfo<cr>", desc = "Info" },
    },
  },
}
