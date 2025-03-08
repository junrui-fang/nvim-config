return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = { enableServerSideFuzzyMatch = true },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = "always" },
              suggest = { completeFunctionCalls = true },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = "all" },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = true },
              },
            },
            javascript = {
              updateImportsOnFileMove = { enabled = "always" },
              inlayHints = {
                parameterNames = { enabled = "literals" },
                parameterTypes = { enabled = true },
                variableTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                enumMemberValues = { enabled = true },
              },
            },
          },
        },
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            format = false,
          },
        },
      },
    },
  },

  -- Add nvim-vtsls for additional TypeScript capabilities
  {
    "yioneko/nvim-vtsls",
    lazy = true,
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "vtsls" then require("vtsls")._on_attach(args.data.client_id, args.buf) end
        end,
      })
    end,
  },

  -- Prettier configuration
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      -- Initialize formatter tables if they don't exist
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters = opts.formatters or {}

      -- Define the filetypes we want to configure
      local js_ts_filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "json",
        "jsonc",
      }

      -- Helper function to check for Prettier config files
      local function has_prettier_config(ctx)
        return vim.fs.find({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          "prettier.config.js",
          "prettier.config.cjs",
          ".prettierrc.toml",
          ".prettierrc.mjs",
          "prettier.config.mjs",
        }, { path = ctx.filename, upward = true })[1] ~= nil
      end

      -- Helper function to check for Prettier in dependencies
      local function has_prettier_dep(ctx)
        local package_json = vim.fs.find("package.json", { path = ctx.filename, upward = true })[1]
        if not package_json then return false end

        local ok, json = pcall(function()
          local content = vim.fn.readfile(package_json)
          return vim.fn.json_decode(table.concat(content, "\n"))
        end)

        if not ok or type(json) ~= "table" then return false end

        local deps = json.dependencies or {}
        local dev_deps = json.devDependencies or {}

        return deps.prettier ~= nil or dev_deps.prettier ~= nil
      end

      -- Configure Prettier formatter
      opts.formatters.prettier = {
        -- Only use prettier if we have a config or dependency
        condition = function(self, ctx)
          -- Cache the result to avoid rechecking frequently
          if self._prettier_checked and self._prettier_checked[ctx.filename] then
            return self._prettier_checked[ctx.filename]
          end

          self._prettier_checked = self._prettier_checked or {}
          local should_use = has_prettier_config(ctx) or has_prettier_dep(ctx)
          self._prettier_checked[ctx.filename] = should_use

          return should_use
        end,

        -- Configure arguments based on whether we found a config file
        args = function(self, ctx)
          -- If we have a config file, use it
          if has_prettier_config(ctx) then
            return {
              "--stdin-filepath",
              "$FILENAME",
            }
          else
            -- Otherwise, use default settings with 4 spaces
            return {
              "--tab-width",
              "4",
              "--stdin-filepath",
              "$FILENAME",
            }
          end
        end,
      }

      -- Apply prettier to all relevant filetypes
      for _, ft in ipairs(js_ts_filetypes) do
        opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
        if
          type(opts.formatters_by_ft[ft]) == "table"
          and not vim.tbl_contains(opts.formatters_by_ft[ft], "prettier")
        then
          table.insert(opts.formatters_by_ft[ft], "prettier")
        end
      end
    end,
  },

  -- NOTE: thanks to Claude 3.7 Sonnet & LazyVim
  -- TODO: verify paths, build outputs, source maps
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      -- Setup js-debug-adapter using either executable directly or via Node
      if not dap.adapters["pwa-node"] then
        local js_debug_path = vim.fn.exepath("js-debug-adapter")
        if js_debug_path and js_debug_path ~= "" then
          -- If executable is available, use it directly
          dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              command = js_debug_path,
              args = { "${port}" },
            },
          }
        else
          -- Fallback to Node approach for better compatibility
          dap.adapters["pwa-node"] = {
            type = "server",
            host = "localhost",
            port = "${port}",
            executable = {
              command = "node",
              args = {
                vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
                "${port}",
              },
            },
          }
        end
      end

      -- Add compatibility for regular node debugging
      if not dap.adapters["node"] then
        dap.adapters["node"] = function(cb, config)
          if config.type == "node" then config.type = "pwa-node" end
          local nativeAdapter = dap.adapters["pwa-node"]
          if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      -- Setup Chrome browser debugging
      if not dap.adapters["pwa-chrome"] then
        dap.adapters["pwa-chrome"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = {
              vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
              "${port}",
            },
          },
        }
      end

      -- Add compatibility for chrome debugging
      if not dap.adapters["chrome"] then
        dap.adapters["chrome"] = function(cb, config)
          if config.type == "chrome" then config.type = "pwa-chrome" end
          local nativeAdapter = dap.adapters["pwa-chrome"]
          if type(nativeAdapter) == "function" then
            nativeAdapter(cb, config)
          else
            cb(nativeAdapter)
          end
        end
      end

      -- Define JS/TS filetypes
      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }

      -- Setup VSCode launch config to filetypes mapping
      local vscode_ext = require("dap.ext.vscode")
      vscode_ext.type_to_filetypes["node"] = js_filetypes
      vscode_ext.type_to_filetypes["pwa-node"] = js_filetypes
      vscode_ext.type_to_filetypes["chrome"] = js_filetypes
      vscode_ext.type_to_filetypes["pwa-chrome"] = js_filetypes

      -- Configure debuggers for each JavaScript and TypeScript related filetype
      for _, lang in ipairs(js_filetypes) do
        dap.configurations[lang] = {
          -- Basic Node.js debugging
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (Node.js)",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          -- Node.js debugging (compiled JavaScript)
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (compiled JS)",
            program = "${workspaceFolder}/dist/${fileBasenameNoExtension}.js",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**/*.ts" },
            skipFiles = { "<node_internals>/**" },
          },
          -- Node.js debugging with ts-node (direct TypeScript execution)
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file (ts-node)",
            runtimeArgs = { "--loader", "ts-node/esm" },
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**" },
            resolveSourceMapLocations = { "${workspaceFolder}/**/*.ts" },
          },
          -- Node.js attach to process
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to Node.js process",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            sourceMaps = true,
          },
          -- Chrome browser debugging
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (React/Next.js)",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
            sourceMapPathOverrides = {
              -- React
              ["webpack:///src/*"] = "${webRoot}/src/*",
              -- Next.js
              ["webpack:///./*"] = "${webRoot}/*",
              ["webpack:///./~/*"] = "${webRoot}/node_modules/*",
            },
            userDataDir = false,
          },
          -- Vite app debugging
          {
            type = "pwa-chrome",
            request = "launch",
            name = "Launch Chrome (Vite)",
            url = "http://localhost:5173",
            webRoot = "${workspaceFolder}",
            sourceMaps = true,
            sourceMapPathOverrides = {
              ["webpack:///src/*"] = "${webRoot}/src/*",
            },
            userDataDir = false,
          },
          -- Jest test debugging
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/jest/bin/jest.js",
              "--runInBand",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            sourceMaps = true,
          },
        }
      end
    end,
  },

  {
    "vuki656/package-info.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "BufRead package.json",
    opts = {},
    keys = {
      {
        "<leader>Ps",
        function() require("package-info").show() end,
        desc = "Show package info",
        ft = "json",
      },
      {
        "<leader>Pc",
        function() require("package-info").change_version() end,
        desc = "Change package version",
        ft = "json",
      },
      {
        "<leader>Pd",
        function() require("package-info").delete() end,
        desc = "Delete package",
        ft = "json",
      },
      {
        "<leader>Pi",
        function() require("package-info").install() end,
        desc = "Install package",
        ft = "json",
      },
    },
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
    keys = {
      { "<leader>ltt", ":TSC<CR>", desc = "Check Types", ft = "typescript" },
      { "<leader>lts", ":TSCStop<CR>", desc = "Stop", ft = "typescript" },
      { "<leader>lto", ":TSCOpen<CR>", desc = "Open Quickfix", ft = "typescript" },
      { "<leader>ltc", ":TSCClose<CR>", desc = "Close Quickfix", ft = "typescript" },
    },
  },
}
