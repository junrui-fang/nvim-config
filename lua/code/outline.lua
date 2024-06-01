return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },

    opts = {
      backends = { "treesitter", "lsp", "markdown", "man" },
      attach_mode = "global",
      show_guides = true,
      filter_kind = false,
      icons = require("utils.icons").kinds,
      guides = {
        mid_item = "├╴",
        last_item = "└╴",
        nested_top = "│ ",
        whitespace = "  ",
      },
      layout = {
        min_width = 30,
        default_direction = "prefer_left",
      },
    },

    keys = {
      { "<leader>lo", "<cmd>AerialToggle!<CR>", desc = "Outline" },
    },
  },
}
