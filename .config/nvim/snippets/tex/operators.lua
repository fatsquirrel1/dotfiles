---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds

local conds_expand = require("luasnip.extras.conditions.expand")

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	s(
		{
			trig = "ddx",
			name = "Derivative",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \frac{\mathrm d <> }{\mathrm d <>} 
    ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{
			trig = "ppx",
			name = "Partial Derivative",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \frac{\partial <>}{\partial <>} <>
    ]],
			{
				i(1),
				i(2),
				i(0),
			}
		)
	),
	s(
		{
			trig = ";sq",
			name = "Square Root",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \sqrt{<>} 
        ]],
			{
				i(1),
				-- d(1, function(_, snip)
				-- 	local input = snip.captures[1]
				-- 	if input == "(" then
				-- 		return sn(nil, { t("("), i(1), t(")") })
				-- 	elseif input == "{" then
				-- 		return sn(nil, { t("\\{"), i(1), t("\\}") })
				-- 	elseif input == "[" then
				-- 		return sn(nil, { t("["), i(1), t("]") })
				-- 	else
				-- 		return sn(nil, t(input))
				-- 	end
				-- end),
			}
		)
	),
	s(
		{ trig = "sum", name = "Sum", snippetType = "autosnippet" },
		fmta(
			[[
    \sum_{<>}^{<>} <>
    ]],
			{ i(1), i(2), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "lint",
			name = "Lebesgue Integral",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \int_{<>} <>
    ]],
			{ i(1, "\\Omega"), i(0) }
		)
	),
	s(
		{
			trig = "rint",
			name = "Integral",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta([[\int_{<>}^{<>} <>]], {
			i(1, "lower"),
			i(2, "upper"),
			i(0),
		})
	),
	s(
		{
			trig = "lim",
			name = "Limit",
			snippetType = "autosnippet",
		},
		fmta(
			[[
    \lim_{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{ trig = "supr", name = "Supremum", snippetType = "autosnippet" },
		fmta(
			[[
    \sup_{<>} <>
    ]],
			{ i(1), i(0) }
		),
		{ condition = in_mathzone }
	),
	s(
		{
			trig = "esup",
			name = "Essential Supremum",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \esssup_{<>} <>
    ]],
			{ i(1), i(0) }
		)
	),
	s(
		{
			trig = "liin",
			name = "liminf",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \liminf_{<>} 
  ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "lisu",
			name = "limsup",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \limsup_{<>} 
  ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "ifm",
			name = "Infimum",
			snippetType = "autosnippet",
			priority = 9999,
			condition = in_mathzone,
		},
		fmta(
			[[
    \inf_{<>} <>
    ]],
			{ i(1), i(0) }
		)
	),
	s(
		{
			trig = "supp",
			name = "Support",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \mathrm{supp} ( <> ) 
  ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "divg", name = "Divergence", snippetType = "autosnippet" },
		fmta(
			[[
  \divg (<>) 
  ]],
			{ i(1) }
		),
		{ condition = in_mathzone }
	),
}
