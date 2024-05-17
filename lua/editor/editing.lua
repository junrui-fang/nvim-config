return {
  -- Powerful surround manipulation
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",

    opts = {},
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {},
  },

  -- Auto-pairs
  {
    "windwp/nvim-autopairs",
    dependencies = { "hrsh7th/nvim-cmp" },
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
      -- If you want insert `(` after select function or method item
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  -- Auto-saving
  {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      execution_message = {
        enabled = false,
      },
      debounce_delay = 0,
    },
    keys = { { "<leader>sta", "<cmd>ASToggle<cr>", desc = "Auto-save" } },
  },

  -- Search & Replace
  {
    "nvim-pack/nvim-spectre",
    build = false,

    cmd = "Spectre",

    opts = {
      -- open_cmd = "noswapfile vnew",
    },

    keys = {
      {
        "<leader>;r",
        '<cmd>lua require("spectre").toggle()<cr>',
        desc = "Replace",
      },
      {
        "<leader>;w",
        '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
        desc = "Replace current word",
      },
      {
        "<leader>;w",
        '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
        mode = "v",
        desc = "Replace current word",
      },
      {
        "<leader>;p",
        '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
        desc = "Replace on current file",
      },
    },
  },
}
