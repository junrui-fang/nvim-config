return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
              },
            },
          },
        },
        ruff = {},
      },
    },
  },

  -- Debug
  -- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/python.lua
  -- https://github.com/AstroNvim/astrocommunity/blob/d64d788e163f6d759e8a1adf4281dd5dd2841a78/lua/astrocommunity/pack/python/init.lua
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    ft = "python",
    config = function()
      require("dap-python").setup() -- if use conda
      -- local path = require("mason-registry").get_package("debugpy"):get_install_path()
      -- path = path .. "/venv/bin/python"
      -- require("dap-python").setup(path)
    end,

    keys = {
      { "<leader>'m", function() require("dap-python").test_method() end, desc = "Debug Method", ft = "python" },
      { "<leader>'f", function() require("dap-python").test_class() end, desc = "Debug Class", ft = "python" },
      {
        "<leader>'s",
        function() require("dap-python").debug_selection() end,
        desc = "Debug Selection",
        ft = "python",
        mode = "x",
      },
    },
  },

  -- Test
  {
    "nvim-neotest/neotest",
    dependencies = "nvim-neotest/neotest-python",
    opts = {
      adapters = {
        ["neotest-python"] = {
          -- runner = "pytest",
          -- python = ".venv/bin/python",
        },
      },
    },
  },

  -- Virtual Environment
  {
    "linux-cultist/venv-selector.nvim",
    enabled = false,
    branch = "regexp", -- for new version
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "VenvSelect", "VenvSelectLog" },
    config = function() require("venv-selector").setup() end,
    keys = {
      { "<leader>lv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },

  {
    "AckslD/swenv.nvim",
    -- enabled = false,
    ft = "python",
    config = function()
      require("swenv").setup({
        post_set_venv = function() vim.cmd("LspRestart") end,
      })
    end,
    keys = {
      { "<leader>lv", "<cmd>lua require('swenv.api').pick_venv()<cr>", desc = "Select VirtualEnv", ft = "python" },
    },
  },
}
