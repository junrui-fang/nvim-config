return {
  "nvim-pack/nvim-spectre",
  build = false,

  cmd = "Spectre",

  opts = {
    -- open_cmd = "noswapfile vnew",
  },

  keys = {
    {
      "<leader>;r",
      '<cmd>lua require("spectre").toggle()<cr>',
      desc = "Replace",
    },
    {
      "<leader>;w",
      '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
      desc = "Replace current word",
    },
    {
      "<leader>;w",
      '<cmd>lua require("spectre").open_visual({select_word=true})<cr>',
      mode = "v",
      desc = "Replace current word",
    },
    {
      "<leader>;p",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
      desc = "Replace on current file",
    },
  },
}
