return {
  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistsList" },
    opts = {
      private = true,
      mappings = {
        next_file = "<C-j>",
        prev_file = "<C-k>",
      },
    },
    keys = {
      { "<leader>ghi", "<cmd>GistCreate<cr>", desc = "Create Gist" },
      { "<leader>ghi", ":'<,'>GistCreate<cr>", desc = "Create Gist", mode = "x" },
      { "<leader>ghI", "<cmd>GistsList<cr>", desc = "Gist List" },
    },
  },

  -- Generate sharable file permalinks
  {
    "linrongbin16/gitlinker.nvim",
    cmd = "GitLink",
    opts = {},
    keys = {
      { "<leader>ghl", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Yank git link" },
      { "<leader>ghL", "<cmd>GitLink!<cr>", mode = { "n", "v" }, desc = "Open git link" },
    },
  },
}
