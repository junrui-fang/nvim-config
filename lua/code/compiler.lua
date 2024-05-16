return {
  {
    "Zeioth/compiler.nvim",
    dependencies = {
      { "stevearc/overseer.nvim", opts = {} },
    },
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {},

    keys = {
      { "<leader>--", "<cmd>CompilerOpen<cr>", desc = "Open Compiler" },
      { "<leader>-r", "<cmd>CompilerToggleResults<cr>", desc = "Results" },
      { "<leader>-R", "<cmd>CompilerRedo<cr>", desc = "Redo" },
    },
  },
}
