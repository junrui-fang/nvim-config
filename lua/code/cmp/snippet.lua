return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      {
        "rafamadriz/friendly-snippets",
        config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
      },
    },
    event = { "InsertEnter", "CmdlineEnter" },

    keys = {
      {
        "<tab>",
        function() return require("luasnip").expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<tab>" end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function() require("luasnip").jump(1) end,
        mode = "s",
      },
      {
        "<s-tab>",
        function() require("luasnip").jump(-1) end,
        mode = { "i", "s" },
      },
    },

    config = function()
      require("luasnip").setup({
        -- Enable autotriggered snippets
        enable_autosnippets = true,
        -- Use Tab (or some other key if you prefer) to trigger visual selection
        store_selection_keys = "<Tab>",
        -- Make the repeated node to update as typing
        update_events = "TextChanged,TextChangedI",
      })
    end,
    require("luasnip.loaders.from_lua").load({ lazy_paths = { "~/.config/nvim/snippets/" } }),
  },
}
