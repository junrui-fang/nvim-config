return {
  {
    "nvim-neorg/neorg",
    dependencies = { "vhyrro/luarocks.nvim" },
    version = "*",

    ft = "norg",
    cmd = "Neorg",

    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},

          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Projects/Note/notes/",
              },
            },
          },

          ["core.presenter"] = {
            config = {
              zen_mode = "zen-mode",
            },
          },
        },
      })
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,

    keys = {
      { "<leader>pn", "<cmd>Neorg index<cr>", desc = "Notes" },
    },
  },
}
