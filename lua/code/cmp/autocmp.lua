return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "petertriho/cmp-git",

      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      "onsails/lspkind.nvim",
    },

    event = { "InsertEnter", "CmdlineEnter" },

    config = function()
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp_mapping = require("cmp.config.mapping")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          -- Snippet engine to use
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },

        -- Pretty symbols
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp_mapping(cmp_mapping.select_next_item(), { "i", "c" }),
          ["<C-k>"] = cmp_mapping(cmp_mapping.select_prev_item(), { "i", "c" }),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })

      -- Setup up vim-dadbod
      cmp.setup.filetype({ "sql", "mysql", "plsql" }, {
        sources = {
          { name = "vim-dadbod-completion" },
          { name = "buffer" },
        },
      })

      -- Set configuration for specific filetype.
      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "git" }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
        }, {
          { name = "buffer" },
        }),
      })
      require("cmp_git").setup()

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      -- Insert `(` after select function or method item
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
