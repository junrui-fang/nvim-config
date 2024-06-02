return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "folke/neodev.nvim", opts = {} },
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
          local map = function(keys, func, desc) vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc }) end

          map("K", vim.lsp.buf.hover, "Hover Documentation")
          map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("gr", require("telescope.builtin").lsp_references, "Goto References")
          map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
          map("gy", require("telescope.builtin").lsp_type_definitions, "Type Definition")

          map("<leader>ls", require("telescope.builtin").lsp_document_symbols, "Buffer Symbols")
          map("<leader>lS", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")

          map("<leader>aa", vim.lsp.buf.code_action, "Code Action")

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          -- highlight references of the word under cursor
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            -- When cursor moves, the highlights will be cleared
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
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map(
              "<leader>lh",
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end,
              "Toggle Inlay Hints"
            )
          end

          -- CodeLens
          if client and client.server_capabilities.codeLensProvider then
            map("<leader>lc", function() vim.lsp.codelens.refresh() end, "Codelens Refresh")
            map("<leader>lC", function() vim.lsp.codelens.clear() end, "Codelens Off")
          end
        end,
      })

      -- create new capabilities with nvim cmp, then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      -- general on_attach
      local on_attach = function(client, bufnr)
        -- code context
        if client.server_capabilities.documentSymbolProvider then require("nvim-navic").attach(client, bufnr) end
        -- Disable hover of Ruff in favor of Pyright
        if client.name == "ruff" then client.server_capabilities.hoverProvider = false end
      end

      local servers = opts.servers
      local ensure_installed = vim.tbl_keys(servers or {})

      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
        handlers = {
          function(server_name)
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
