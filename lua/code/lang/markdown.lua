return {
  {
    "neovim/nvim-lspconfig",
    opts = { servers = { marksman = {} } },
  },

  -- Preview with a browser or a webview window
  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:fast",
    config = function()
      require("peek").setup({
        app = "webview",
        theme = "light",
        syntax = true, -- code block syntax highlight
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
    keys = {
      { "<leader>m", "<cmd>PeekOpen<cr>", ft = "markdown", desc = "Markdown Preview" },
    },
  },

  -- UI
  {
    "MeanderingProgrammer/markdown.nvim",
    name = "render-markdown", -- if another plugin named markdown.nvim
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    ft = "markdown",
    config = function()
      require("render-markdown").setup({
        start_enabled = false,
      })
    end,
    keys = {
      { "<leader>Um", "<cmd>RenderMarkdownToggle<cr>", ft = "markdown", desc = "Markdown Render Toggle" },
    },
  },
}
