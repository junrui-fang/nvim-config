return {
  {
    "cvigilv/esqueleto.nvim",

    opts = {
      directories = { vim.fn.stdpath("config") .. "/skeletons" },
      autouse = true,
      patterns = function(dir) return vim.fn.readdir(dir) end,

      -- Advanced options
      advanced = {
        ignored = {}, -- List of glob patterns or function that determines if a file is ignored
        ignore_os_files = true, -- whether to ignore OS files (e.g. .DS_Store)
      },
    },
  },
}
