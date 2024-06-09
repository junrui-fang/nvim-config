return { -- examples: https://github.com/anuvyklack/hydra.nvim/wiki/Git
  "nvimtools/hydra.nvim",
  enabled = false,
  config = function()
    -- Common Hydra Config
    require("hydra").setup({
      debug = false,
      exit = false,
      foreign_keys = "run", -- "warn" | "run" | nil
      color = "red",
      timeout = false,
      invoke_on_body = true,
      hint = { -- https://github.com/nvimtools/hydra.nvim?tab=readme-ov-file#hint-configuration
        type = "window",
        show_name = true, -- only useful for auto-generated hint
        position = { "middle" },
        offset = 0,
        float_opts = {
          style = "minimal",
          border = "rounded",
          focusable = false,
          noautocmd = true,
        },
      },
      on_enter = nil,
      on_exit = nil,
      on_key = nil,
    })
  end,
}
