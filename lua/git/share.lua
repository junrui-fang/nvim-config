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
}
