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
              experimental = { completion = { enableServerSideFuzzyMatch = true } },
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
      },
    },
  },

  -- ESLint integration via none-ls with none-ls-extras
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
      -- Function to check if ESLint is configured for the project
      local function has_eslint_config(utils)
        return utils.root_has_file({
          ".eslintrc",
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          ".eslintrc.yml",
          ".eslintrc.yaml",
          "eslint.config.js",
        })
      end

      -- Get eslint_d from none-ls-extras
      local eslint_d_diagnostics = require("none-ls.diagnostics.eslint_d")
      local eslint_d_code_actions = require("none-ls.code_actions.eslint_d")

      -- Set condition for both sources
      eslint_d_diagnostics = eslint_d_diagnostics.with({
        condition = has_eslint_config,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      eslint_d_code_actions = eslint_d_code_actions.with({
        condition = has_eslint_config,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      })

      return {
        sources = {
          eslint_d_diagnostics,
          eslint_d_code_actions,
        },
      }
    end,
  },

  -- NOTE: thanks to Claude 3.7 Sonnet & LazyVim
  -- TODO: verify paths, build outputs, source maps
  {
    "mfussenegger/nvim-dap",
    opts = function()
      local dap = require("dap")

      -- Setup js-debug-adapter using executable path
      if not dap.adapters["pwa-node"] then
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = vim.fn.exepath("js-debug-adapter") or vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
            args = { "${port}" },
          },
        }
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
            command = vim.fn.exepath("js-debug-adapter") or vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
            args = { "${port}" },
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

      -- Setup VSCode launch config to filetypes mapping
      local vscode_ext = require("dap.ext.vscode")
      local js_filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" }
      vscode_ext.type_to_filetypes["node"] = js_filetypes
      vscode_ext.type_to_filetypes["pwa-node"] = js_filetypes
      vscode_ext.type_to_filetypes["chrome"] = js_filetypes
      vscode_ext.type_to_filetypes["pwa-chrome"] = js_filetypes

      -- Configure debuggers for each JavaScript and TypeScript related filetype
      for _, lang in ipairs({ "javascript", "javascriptreact", "typescript", "typescriptreact" }) do
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
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**/*.ts" },
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
              -- Add source map path overrides for frameworks as needed
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
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**/*.ts" },
          },
          -- npm script debugging
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug npm script",
            runtimeExecutable = "npm",
            runtimeArgs = { "run-script", "debug" },
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**/*.ts" },
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
          },
          -- Debug using current file path (flexible)
          {
            type = "pwa-node",
            request = "launch",
            name = "Debug Current File",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            smartStep = true,
            outFiles = { "${workspaceFolder}/dist/**/*.js" },
            resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**/*.ts" },
            protocol = "inspector",
            console = "integratedTerminal",
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
    -- TODO: Add keymaps
  },

  {
    "dmmulroy/tsc.nvim",
    cmd = "TSC",
    opts = {},
  },
}
