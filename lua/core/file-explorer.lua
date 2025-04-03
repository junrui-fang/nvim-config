return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window
    },

    cmd = "Neotree",

    opts = {
      filesystem = { follow_current_file = { enabled = true } },
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
      },
    },

    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
    },
  },
}
