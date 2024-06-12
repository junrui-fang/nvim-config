-- INFO:
-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/extras/lang/java.lua
-- https://github.com/bcampolo/nvim-starter-kit/blob/java/.config/nvim/ftplugin/java.lua

local java_filetypes = { "java" }
local function extend_or_override(config, custom, ...)
  if type(custom) == "function" then
    config = custom(config, ...) or config
  elseif custom then
    config = vim.tbl_deep_extend("force", config, custom)
  end
  return config
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { jdtls = {} },
      setup = { jdtls = function() return true end },
    },
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    opts = function()
      return {
        -- How to find the root dir for a given filename
        root_dir = require("lspconfig.server_configurations.jdtls").default_config.root_dir,
        -- How to find the project name for a given root dir
        project_name = function(root_dir) return root_dir and vim.fs.basename(root_dir) end,

        -- Where are the config and workspace dirs for a project?
        jdtls_config_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/config"
        end,
        jdtls_workspace_dir = function(project_name)
          return vim.fn.stdpath("cache") .. "/jdtls/" .. project_name .. "/workspace"
        end,

        -- How to run jdtls
        cmd = { vim.fn.exepath("jdtls") },
        full_cmd = function(opts)
          local fname = vim.api.nvim_buf_get_name(0)
          local root_dir = opts.root_dir(fname)
          local project_name = opts.project_name(root_dir)
          local cmd = vim.deepcopy(opts.cmd)
          if project_name then
            vim.list_extend(cmd, {
              "-configuration",
              opts.jdtls_config_dir(project_name),
              "-data",
              opts.jdtls_workspace_dir(project_name),
            })
          end
          return cmd
        end,

        -- These depend on nvim-dap, but can additionally be disabled by setting false here.
        dap = { hotcodereplace = "auto", config_overrides = {} },
        dap_main = {},
        test = true,
        settings = {
          java = {
            eclipse = { downloadSources = true },
            configuration = { updateBuildConfiguration = "interactive" },
            maven = { downloadSources = true },
            implementationsCodeLens = { enabled = true },
            referencesCodeLens = { enabled = true },
          },
          signatureHelp = { enabled = true },
          completion = {
            favoriteStaticMembers = {
              "org.hamcrest.MatcherAssert.assertThat",
              "org.hamcrest.Matchers.*",
              "org.hamcrest.CoreMatchers.*",
              "org.junit.jupiter.api.Assertions.*",
              "java.util.Objects.requireNonNull",
              "java.util.Objects.requireNonNullElse",
              "org.mockito.Mockito.*",
            },
          },
          sources = {
            organizeImports = {
              starThreshold = 9999,
              staticStarThreshold = 9999,
            },
          },
        },
      }
    end,

    config = function(_, opts)
      local mason_registry = require("mason-registry")
      local bundles = {}
      local java_dbg_pkg = mason_registry.get_package("java-debug-adapter")
      local java_dbg_path = java_dbg_pkg:get_install_path()
      local jar_patterns = {
        java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar",
      }
      -- java-test also depends on java-debug-adapter.
      if opts.test and mason_registry.is_installed("java-test") then
        local java_test_pkg = mason_registry.get_package("java-test")
        local java_test_path = java_test_pkg:get_install_path()
        vim.list_extend(jar_patterns, {
          java_test_path .. "/extension/server/*.jar",
        })
      end
      for _, jar_pattern in ipairs(jar_patterns) do
        for _, bundle in ipairs(vim.split(vim.fn.glob(jar_pattern), "\n")) do
          table.insert(bundles, bundle)
        end
      end

      local function attach_jdtls()
        local fname = vim.api.nvim_buf_get_name(0)
        -- Configuration can be augmented and overridden by opts.jdtls
        local config = extend_or_override({
          cmd = opts.full_cmd(opts),
          root_dir = opts.root_dir(fname),
          init_options = {
            bundles = bundles,
          },
          settings = opts.settings,
          -- enable CMP capabilities
          capabilities = require("cmp_nvim_lsp").default_capabilities() or nil,
        }, opts.jdtls)

        -- Existing server will be reused if the root_dir matches.
        require("jdtls").start_or_attach(config)
        -- not need to require("jdtls.setup").add_commands(), start automatically adds commands
      end

      -- Attach the jdtls for each java buffer.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = java_filetypes,
        callback = attach_jdtls,
      })

      -- Setup keymap and dap after the lsp is fully attached.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            local wk = require("which-key")
            wk.register({
              ["<leader>lx"] = { name = "+extract" },
              ["<leader>lxv"] = { require("jdtls").extract_variable_all, "Extract Variable" },
              ["<leader>lxc"] = { require("jdtls").extract_constant, "Extract Constant" },
              ["gs"] = { require("jdtls").super_implementation, "Goto Super" },
              ["gS"] = { require("jdtls.tests").goto_subjects, "Goto Subjects" },
              ["<leader>lO"] = { require("jdtls").organize_imports, "Organize Imports" },
            }, { mode = "n", buffer = args.buf })
            wk.register({
              ["<leader>lx"] = { name = "+extract" },
              ["<leader>lxm"] = {
                [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]],
                "Extract Method",
              },
              ["<leader>lxv"] = {
                [[<ESC><CMD>lua require('jdtls').extract_variable_all(true)<CR>]],
                "Extract Variable",
              },
              ["<leader>lxc"] = {
                [[<ESC><CMD>lua require('jdtls').extract_constant(true)<CR>]],
                "Extract Constant",
              },
            }, { mode = "v", buffer = args.buf })

            if opts.dap and mason_registry.is_installed("java-debug-adapter") then
              -- custom init for Java debugger
              require("jdtls").setup_dap(opts.dap)
              require("jdtls.dap").setup_dap_main_class_configs(opts.dap_main)

              -- Java Test require Java debugger to work
              if opts.test and mason_registry.is_installed("java-test") then
                -- custom keymaps for Java test runner (not yet compatible with neotest)
                wk.register({
                  ["<leader>'a"] = { require("jdtls.dap").test_class, "Run All Test" },
                  ["<leader>'r"] = { require("jdtls.dap").test_nearest_method, "Run Nearest Test" },
                  ["<leader>'T"] = { require("jdtls.dap").pick_test, "Run Test" },
                }, { mode = "n", buffer = args.buf })
              end
            end

            -- User can set additional keymaps in opts.on_attach
            if opts.on_attach then opts.on_attach(args) end
          end
        end,
      })
      -- Avoid race condition by calling attach the first time, since the autocmd won't fire.
      attach_jdtls()
    end,
  },
}
