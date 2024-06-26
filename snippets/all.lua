---@diagnostic disable: undefined-global
local snippet = require("luasnip").snippet

return {
  snippet({ trig = "hi" }, { t("Hello, world!") }),
}
