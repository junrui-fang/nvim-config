---@diagnostic disable: undefined-global

-- INFO: https://ejmastnak.com/tutorials/vim-latex/luasnip/
-- INFO: https://github.com/ejmastnak/dotfiles/blob/main/config/nvim/LuaSnip/tex/math.lua
local helpers = require("utils.luasnip")
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn["vimtex#syntax#in_mathzone"]() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- TODO: seperate them into topics
return {
  -- ABSOLUTE VALUE
  s(
    { trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta("<>\\abs{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- FRACTION
  s(
    { trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\frac{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- SQUARE ROOT
  s(
    { trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sqrt{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- LOGARITHM WITH BASE SUBSCRIPT
  s(
    { trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\log_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  -- BINOMIAL SYMBOL
  s(
    { trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\binom{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- DOT PRODUCT, i.e. \cdot
  s({ trig = ",.", snippetType = "autosnippet" }, {
    t("\\cdot "),
  }),
  -- CROSS PRODUCT, i.e. \times
  s({ trig = "xx", snippetType = "autosnippet" }, {
    t("\\times "),
  }),
  -- CDOTS, i.e. \cdots
  s({ trig = "cdd", snippetType = "autosnippet" }, {
    t("\\cdots"),
  }),
  -- LDOTS, i.e. \ldots
  s({ trig = "ldd", snippetType = "autosnippet" }, {
    t("\\ldots"),
  }),
  -- EQUIV, i.e. \equiv
  s({ trig = "eqq", snippetType = "autosnippet" }, {
    t("\\equiv "),
  }),

  -- SETMINUS, i.e. \setminus
  s({ trig = "stm", snippetType = "autosnippet" }, {
    t("\\setminus "),
  }),
  -- SUBSET, i.e. \subset
  s({ trig = "sbb", snippetType = "autosnippet" }, {
    t("\\subset "),
  }),
  -- IMPLIES, i.e. \implies
  s({ trig = ">>", snippetType = "autosnippet" }, {
    t("\\implies "),
  }),

  -- VECTOR, i.e. \vec
  s(
    { trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\vec{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- DEFAULT UNIT VECTOR WITH SUBSCRIPT, i.e. \unitvector_{}
  s(
    { trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\unitvector_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- UNIT VECTOR WITH HAT, i.e. \uvec{}
  s(
    { trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\uvec{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- MATRIX, i.e. \mat{}
  s(
    { trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\mat{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- DERIVATIVE with denominator only
  s(
    { trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dvOne{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- DERIVATIVE with numerator and denominator
  s(
    { trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dv{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- DERIVATIVE with numerator, denominator, and higher-order argument
  s(
    { trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\dvN{<>}{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex.in_mathzone }
  ),
  -- PARTIAL DERIVATIVE with denominator only
  s(
    { trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdvOne{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),
  -- PARTIAL DERIVATIVE with numerator and denominator
  s(
    { trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdv{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- PARTIAL DERIVATIVE with numerator, denominator, and higher-order argument
  s(
    { trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\pdvN{<>}{<>}{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex.in_mathzone }
  ),
  -- SUM with lower limit
  s(
    { trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
    }),
    { condition = tex.in_mathzone }
  ),
  -- SUM with upper and lower limit
  s(
    { trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\sum_{<>}^{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- INTEGRAL with upper and lower limit
  s(
    { trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{<>}^{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      i(1),
      i(2),
    }),
    { condition = tex.in_mathzone }
  ),
  -- INTEGRAL from positive to negative infinity
  s(
    { trig = "([^%a])intf", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\int_{\\infty}^{\\infty}", {
      f(function(_, snip) return snip.captures[1] end),
    }),
    { condition = tex.in_mathzone }
  ),
  -- BOXED command
  s(
    { trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta("<>\\boxed{<>}", {
      f(function(_, snip) return snip.captures[1] end),
      d(1, get_visual),
    }),
    { condition = tex.in_mathzone }
  ),

  -- DIFFERENTIAL, i.e. \diff
  s({ trig = "df", snippetType = "autosnippet", priority = 2000 }, {
    t("\\diff"),
  }, { condition = tex.in_mathzone }),
  -- BASIC INTEGRAL SYMBOL, i.e. \int
  s({ trig = "in1", snippetType = "autosnippet" }, {
    t("\\int"),
  }, { condition = tex.in_mathzone }),
  -- DOUBLE INTEGRAL, i.e. \iint
  s({ trig = "in2", snippetType = "autosnippet" }, {
    t("\\iint"),
  }, { condition = tex.in_mathzone }),
  -- TRIPLE INTEGRAL, i.e. \iiint
  s({ trig = "in3", snippetType = "autosnippet" }, {
    t("\\iiint"),
  }, { condition = tex.in_mathzone }),
  -- CLOSED SINGLE INTEGRAL, i.e. \oint
  s({ trig = "oi1", snippetType = "autosnippet" }, {
    t("\\oint"),
  }, { condition = tex.in_mathzone }),
  -- CLOSED DOUBLE INTEGRAL, i.e. \oiint
  s({ trig = "oi2", snippetType = "autosnippet" }, {
    t("\\oiint"),
  }, { condition = tex.in_mathzone }),
  -- GRADIENT OPERATOR, i.e. \grad
  s({ trig = "gdd", snippetType = "autosnippet" }, {
    t("\\grad "),
  }, { condition = tex.in_mathzone }),
  -- CURL OPERATOR, i.e. \curl
  s({ trig = "cll", snippetType = "autosnippet" }, {
    t("\\curl "),
  }, { condition = tex.in_mathzone }),
  -- DIVERGENCE OPERATOR, i.e. \divergence
  s({ trig = "DI", snippetType = "autosnippet" }, {
    t("\\div "),
  }, { condition = tex.in_mathzone }),
  -- LAPLACIAN OPERATOR, i.e. \laplacian
  s({ trig = "laa", snippetType = "autosnippet" }, {
    t("\\laplacian "),
  }, { condition = tex.in_mathzone }),
}
