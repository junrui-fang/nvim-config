return {
  "nvim-pack/nvim-spectre",
  build = false,

  cmd = "Spectre",

  opts = {
    -- open_cmd = "noswapfile vnew",
  },

  keys = {
    {
      "<leader>;rr",
      '<cmd>lua require("spectre").toggle()<cr>',
      desc = "Toggle",
    },
    {
      "<leader>;rw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
      desc = "Current word",
    },
    {
      "<leader>;rw",
      '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
      mode = "v",
      desc = "Current word",
    },
    {
      "<leader>;rf",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
      desc = "On current file",
    },
  },
}
