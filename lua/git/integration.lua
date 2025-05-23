return {
  "lewis6991/gitsigns.nvim",
  lazy = false,

  opts = {
    signs = {
      add = { text = "▎" },
      change = { text = "▎" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      untracked = { text = "┆" },
    },

    -- Keymaps
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map("n", "<leader>gj", function()
        if vim.wo.diff then
          vim.cmd.normal({ "<leader>gj", bang = true })
        else
          gs.nav_hunk("next")
        end
      end, { desc = "Next Hunk" })

      map("n", "<leader>gk", function()
        if vim.wo.diff then
          vim.cmd.normal({ "<leader>gk", bang = true })
        else
          gs.nav_hunk("prev")
        end
      end, { desc = "Prev Hunk" })

      -- Actions
      map("n", "<leader>gr", gs.reset_hunk, { desc = "Reset Hunk" })
      map("n", "<leader>gR", gs.reset_buffer, { desc = "Reset Buffer" })
      map(
        "v",
        "<leader>gr",
        function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Reset Hunk" }
      )

      map("n", "<leader>ga", gs.stage_hunk, { desc = "Stage Hunk" })
      map("n", "<leader>gA", gs.stage_buffer, { desc = "Stage Buffer" })
      map(
        "v",
        "<leader>ga",
        function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
        { desc = "Stage Hunk" }
      )
      map("n", "<leader>gu", gs.stage_hunk, { desc = "Unstage Hunk" })

      map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview Hunk" })
      map("n", "<leader>gbl", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
      map("n", "<leader>gbt", gs.toggle_current_line_blame, { desc = "Toggle Blame" })

      map("n", "<leader>gd", gs.diffthis, { desc = "diff against index" })
      map("n", "<leader>gD", function() gs.diffthis("@") end, { desc = "diff against last commit" })

      map("n", "<leader>gx", gs.preview_hunk_inline, { desc = "Show Deleted" })

      -- Text object
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Hunk" })
    end,
  },
}
