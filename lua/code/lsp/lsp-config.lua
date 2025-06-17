return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "saghen/blink.cmp",
    },
    event = {
      -- "BufReadPost",
      "BufReadPre",
      "BufNewFile",
      "BufWritePre",
    },

    opts = {
      servers = {
        lua_ls = { -- https://luals.github.io/wiki/configuration/#neovim
          settings = {
            Lua = {
              runtime = {
                version = "Lua 5.3",
                path = {
                  "?.lua",
                  "?/init.lua",
                  vim.fn.expand("~/.luarocks/share/lua/5.3/?.lua"),
                  vim.fn.expand("~/.luarocks/share/lua/5.3/?/init.lua"),
                  "/usr/share/5.3/?.lua",
                  "/usr/share/lua/5.3/?/init.lua",
                },
              },
              workspace = {
                checkThirdParty = false,
                library = {
                  vim.fn.expand("~/.luarocks/share/lua/5.3"),
                  "/usr/share/lua/5.3",
                },
              },
              completion = { callSnippet = "Replace" },
              codeLens = { enable = true },
              hint = {
                enable = true,
                arrayIndex = "Disable",
              },
            },
          },
        },
      },
    },

    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
        callback = function(event)
          -- keymaps
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, {
              buffer = event.buf,
              desc = desc,
            })
          end
          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("gr", require("telescope.builtin").lsp_references, "Goto References")
          map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          map("gy", require("telescope.builtin").lsp_type_definitions, "Type Definition")
          map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Buffer Symbols")
          map("<leader>lS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
          map("<leader>aa", vim.lsp.buf.code_action, "Code Action", { "n", "x" })

          local function client_supports_method(client, method, bufnr) return client:supports_method(method, bufnr) end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- highlight references of the word under cursor
          if
            client
            and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
          then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- enable inlay hints if the ls supports them
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map(
              "<leader>lh",
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf })) end,
              "Toggle Inlay Hints"
            )
          end

          -- CodeLens
          if client and client.server_capabilities.codeLensProvider then
            map("<leader>lc", function() vim.lsp.codelens.refresh() end, "Codelens Refresh")
            map("<leader>lC", function() vim.lsp.codelens.clear() end, "Codelens Off")
          end

          -- EslintFixAll on save
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.js", "*.jsx", "*.ts", "*.tsx" },
            callback = function(args)
              local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "eslint" })
              if #clients > 0 then vim.cmd("EslintFixAll") end
            end,
          })
        end,
      })

      -- Diagnostic Config
      vim.diagnostic.config({
        severity_sort = true,
        float = { border = "rounded", source = "if_many" },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        } or {},
        virtual_text = {
          source = "if_many",
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      })

      -- create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- general on_attach
      local on_attach = function(client, bufnr)
        if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
      end

      local servers = opts.servers
      local ensure_installed = vim.tbl_keys(servers or {})
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            if server_name == "jdtls" then return end -- skip jdtls

            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
            server.on_attach = on_attach
            require("lspconfig")[server_name].setup(server)
          end,

          ["sqls"] = function()
            require("lspconfig").sqls.setup({
              -- capabilities = vim.tbl_deep_extend("force", {}, capabilities, capabilities or {}),
              on_attach = function(client, bufnr)
                on_attach(client, bufnr)
                require("sqls").on_attach(client, bufnr)
              end,
            })
          end,
        },
      })
    end,

    keys = {
      { "<leader>lI", "<cmd>LspInfo<cr>", desc = "Server Info" },
    },
  },
}
