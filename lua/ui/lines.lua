return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    event = "VeryLazy",

    opts = {
      options = {
        theme = "auto",
        section_separators = "",
        -- component_separators = "",

        globalstatus = true,
        disabled_filetypes = {
          statusline = { "alpha" },
          winbar = {},
        },
      },

      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "diff", "diagnostics" },
        lualine_x = { "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },

      tabline = {},
      winbar = {
        lualine_c = {
          {
            function() return require("nvim-navic").get_location() end,
            cond = function() return require("nvim-navic").is_available() end,
          },
        },
      },
      inactive_winbar = {},
      extensions = { "lazy", "neo-tree" },
    },
  },

  -- Buffer line
  {
    "akinsho/bufferline.nvim",
    -- version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",

    event = "VeryLazy",

    opts = {
      options = {
        mode = "buffers", -- buffers | tabs

        show_buffer_close_icons = false,
        show_close_icon = false,

        indicator = { style = "none" },
        separator_style = "thick", -- "slant" | "slope" | "thick" | "thin" | { "any", "any" },
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "center",
          },
        },

        diagnostics = "nvim_lsp", -- false | "nvim_lsp" | "coc",
      },
    },

    keys = {
      -- Navigate
      { "<leader>bj", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
      { "<leader>bk", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick a buffer" },

      -- Close buffers
      { "<leader>bh", "<cmd>BufferLineCloseLeft<cr>", desc = "Close to the left" },
      { "<leader>bl", "<cmd>BufferLineCloseRight<cr>", desc = "Close to the right" },
      { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", desc = "Close other buffers" },
      { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "Pick a buffer to close" },

      -- Pin
      { "<leader>bp", "<cmd>BufferLineTogglePin<cr>", desc = "Pin" },

      -- Sort
      { "<leader>bd", "<cmd>BufferLineSortByRelativeDirectory<cr>", desc = "Sort by relative dirs" },
      { "<leader>be", "<cmd>BufferLineSortByExtension<cr>", desc = "Sort by extensions" },
      { "<leader>bt", "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    },
  },

  -- Indent line
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    opts = {
      indent = { char = "│", tab_char = "│" },
      scope = { enabled = true },
      exclude = {
        buftypes = {
          "nofile",
          "terminal",
        },
        filetypes = {
          "help",
          "startify",
          "aerial",
          "alpha",
          "dashboard",
          "lazy",
          "neogitstatus",
          "NvimTree",
          "neo-tree",
          "Trouble",
        },
      },
    },
  },
}
