return {
  "tiagovla/scope.nvim",
  event = "VeryLazy",
  opts = {
    pre_tab_leave = function() vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabLeavePre" }) end,
    post_tab_enter = function() vim.api.nvim_exec_autocmds("User", { pattern = "ScopeTabEnterPost" }) end,
  },
  keys = { { "<leader>pm", "<cmd>ScopeMoveBuf<cr>", desc = "Move Buffer to Tab" } },
}
