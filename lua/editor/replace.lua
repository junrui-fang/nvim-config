return {
  "nvim-pack/nvim-spectre",
  build = false,
  cmd = "Spectre",
  opts = {},
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
      "<leader>;rs",
      '<esc><cmd>lua require("spectre").open_visual()<cr>',
      mode = "v",
      desc = "Selected",
    },
    {
      "<leader>;rf",
      '<cmd>lua require("spectre").open_file_search({select_word=true})<cr>',
      desc = "On current file",
    },
  },
}
