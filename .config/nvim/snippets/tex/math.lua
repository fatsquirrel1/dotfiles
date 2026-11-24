---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds

local conds_expand = require("luasnip.extras.conditions.expand")

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	-- Math symbols
	s(
		{
			trig = "qq",
			name = "Quad",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \quad 
    ]],
			{}
		)
	),
	s(
		{
			trig = "Loo",
			name = "L-infinity",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    {L^\infty} 
    ]],
			{}
		)
	),
	-- Latex Math Environments
	s(
		{
			trig = "matrix",
			name = "Matrix without Delimiters",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \begin{matrix}
      <>
    \end{matrix}
    ]],
			{ i(0) }
		)
	),
	s(
		{
			trig = "pmatrix",
			name = "Matrix with Parentheses",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \begin{pmatrix}
      <>
    \end{pmatrix}
    ]],
			{ i(0) }
		)
	),
	s(
		{
			trig = "bmatrix",
			name = "Matrix with Brackets",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \begin{bmatrix}
      <>
    \end{bmatrix}
    ]],
			{ i(0) }
		)
	),
	s(
		{
			trig = "split",
			name = "Split Environment",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \begin{split}
      <>
    \end{split}
    ]],
			{ i(0) }
		)
	),
	s(
		{
			trig = "sbst",
			name = "Substack",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \substack{<> \\ <>} 
        ]],
			{
				i(1, "top"),
				i(2, "bottom"),
			}
		)
	),
	s(
		{
			trig = "forall",
			name = "Math For All",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \text{ for all } 
    ]],
			{}
		)
	),
	s(
		{
			trig = ";os",
			name = "Overset",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\overset{<>}{<>} 
    ]],
			{ i(2, "over"), i(1, "math") }
		)
	),
	s(
		{
			trig = ";us",
			name = "Underset",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\underset{<>}{<>} 
    ]],
			{ i(2, "under"), i(1, "math") }
		)
	),
	s(
		{
			trig = "tt(.)",
			name = "Text Field",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \text{<><>} 
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				i(1),
			}
		)
	),
	s(
		{
			trig = "cancel",
			name = "Cancel",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "bcancel",
			name = "Cancel (backslash)",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \bcancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "xcancel",
			name = "Cancel (X)",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \xcancel{<>}
        ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "cancelto",
			name = "Cancel with arrow",
			wordTrig = true,
			regTrig = false,
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cancelto{<>}{<>}
        ]],
			{
				i(2, "to"),
				i(1, "math"),
			}
		)
	),
	s(
		{
			trig = "cases",
			name = "Math Cases",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \begin{cases}
    <>
  \end{cases}
  ]],
			{
				i(0),
			}
		)
	),
	s(
		{
			trig = "%-%-",
			name = "Inverse Superscript",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
^{-1} 
        ]],
			{}
		)
	),
	s(
		{
			trig = "%*%*",
			name = "^ Asterisk",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  ^* 
  ]],
			{}
		)
	),
	s(
		{
			trig = ";ub",
			name = "Underbrace",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \underbrace{<>}_{<>} 
    ]],
			{
				i(1, "math"),
				i(2, "under"),
			}
		)
	),
	s(
		{
			trig = ";ob",
			name = "Overbrace",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \overbrace{<>}^{<>} 
    ]],
			{
				i(1, "math"),
				i(2, "over"),
			}
		)
	),
}
