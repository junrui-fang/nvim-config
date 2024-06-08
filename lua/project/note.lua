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
          ["core.completion"] = { config = { engine = "nvim-cmp" } },
          ["core.presenter"] = { config = { zen_mode = "zen-mode" } },
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/Projects/Note/notes/",
              },
            },
          },
        },
      })
      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,

    keys = { { "<leader>pn", "<cmd>Neorg index<cr>", desc = "Notes" } },
  },
}
