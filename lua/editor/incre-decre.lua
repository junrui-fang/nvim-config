return {
  "monaqa/dial.nvim",
  lazy = true,
  init = function()
    local keymap = vim.keymap.set
    keymap("n", "<C-a>", function() require("dial.map").manipulate("increment", "normal") end)
    keymap("n", "<C-x>", function() require("dial.map").manipulate("decrement", "normal") end)
    keymap("n", "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end)
    keymap("n", "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end)
    keymap("v", "<C-a>", function() require("dial.map").manipulate("increment", "visual") end)
    keymap("v", "<C-x>", function() require("dial.map").manipulate("decrement", "visual") end)
    keymap("v", "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end)
    keymap("v", "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end)
  end,

  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal,
        augend.integer.alias.decimal_int,
        augend.integer.alias.hex,
        augend.integer.alias.octal,
        augend.integer.alias.binary,
        augend.date.alias["%Y/%m/%d"],
        augend.date.alias["%m/%d/%Y"],
        augend.date.alias["%d/%m/%Y"],
        augend.date.alias["%m/%d/%y"],
        augend.date.alias["%d/%m/%y"],
        augend.date.alias["%H:%M:%S"],
        augend.date.alias["%H:%M"],
        augend.constant.alias.bool,
        augend.constant.alias.alpha,
        augend.constant.alias.Alpha,
        augend.semver.alias.semver,
        augend.constant.alias.ja_weekday_full,
        augend.date.new({
          pattern = "%B", -- titlecased month names
          default_kind = "day",
        }),
        augend.constant.new({
          elements = {
            "january",
            "february",
            "march",
            "april",
            "may",
            "june",
            "july",
            "august",
            "september",
            "october",
            "november",
            "december",
          },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = {
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Sunday",
          },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = {
            "monday",
            "tuesday",
            "wednesday",
            "thursday",
            "friday",
            "saturday",
            "sunday",
          },
          word = true,
          cyclic = true,
        }),
        augend.case.new({
          types = { "camelCase", "PascalCase", "snake_case", "SCREAMING_SNAKE_CASE" },
        }),
      },
    })
  end,
}
