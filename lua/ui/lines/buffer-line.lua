return {
  "romgrk/barbar.nvim",
  dependencies = { "lewis6991/gitsigns.nvim", "nvim-tree/nvim-web-devicons" },
  init = function() vim.g.barbar_auto_setup = false end,
  lazy = false,

  opts = {
    animation = true,
    auto_hide = false, -- any value >=0 or false
    tabpages = true,
    clickable = false,
    focus_on_close = "previous",
    highlight_alternate = true,
    icons = {
      button = "",
      modified = { button = "●" },
      pinned = { button = " ", filename = true },
    },
    semantic_letters = true,
    sidebar_filetypes = {
      ["neo-tree"] = true,
    },
  },

  keys = {
    -- Navigate
    { "<leader>bj", "<cmd>BufferNext<cr>", desc = "Next Buffer" },
    { "<leader>bk", "<cmd>BufferPrevious<cr>", desc = "Prev Buffer" },
    { "<leader>bb", "<cmd>BufferPick<cr>", desc = "Pick a Buffer" },
    -- Move
    { "<leader>b<", "<cmd>BufferMovePrevious<cr>", desc = "Move Left" },
    { "<leader>b>", "<Cmd>BufferMoveNext<CR>", desc = "Move Right" },
    -- Pin
    { "<leader>bp", "<cmd>BufferPin<cr>", desc = "Pin" },
    { "<leader>bP", "<cmd>BufferCloseAllButPinned<cr>", desc = "Close All but Pinned" },
    -- Sort
    { "<leader>bd", "<cmd>BufferOrderByDirectory<cr>", desc = "Sort by Directory" },
    { "<leader>be", "<cmd>BufferOrderByLanguage<cr>", desc = "Sort by Extension" },
    { "<leader>bn", "<cmd>BufferOrderByName<cr>", desc = "Sort by Name" },
    { "<leader>bw", "<cmd>BufferOrderByWindowNumber<cr>", desc = "Sort by Window" },
    -- Close
    { "<leader>bh", "<cmd>BufferCloseBuffersLeft<cr>", desc = "Close to the left" },
    { "<leader>bl", "<cmd>BufferCloseBuffersRight<cr>", desc = "Close to the right" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrent<cr>", desc = "Close other buffers" },
    { "<leader>bc", "<cmd>BufferPickDelete<cr>", desc = "Pick a buffer to close" },
    {
      "<leader>c",
      function() -- show dashboard if no buffer left
        local bufs = vim.fn.getbufinfo({ buflisted = 1 })
        vim.cmd("BufferClose")
        if not bufs[2] then
          vim.cmd("silent only")
          vim.cmd("Dashboard")
        end
      end,
      desc = "Close",
    },
  },
}
