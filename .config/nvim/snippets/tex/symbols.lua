---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds

local conds_expand = require("luasnip.extras.conditions.expand")

-- Math zone context
-- taken from https://ejmastnak.com/

local in_mathzone = function()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
	-- Set Theory
	s(
		{
			trig = "in",
			name = "In Set",
			wordTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone * conds_expand.trigger_not_preceded_by("\\"),
		},
		fmta(
			[[
    \in 
    ]],
			{}
		)
	),
	s(
		{
			trig = "`0",
			name = "Empty Set",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \emptyset 
        ]],
			{}
		)
	),
	s(
		{
			trig = "seq",
			name = "Subset Eq",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \subseteq 
    ]],
			{}
		)
	),
	s(
		{
			trig = "sub",
			name = "Subset",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \subset 
    ]],
			{}
		)
	),
	s(
		{
			trig = "cap",
			name = "Intersection",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \cap 
    ]],
			{}
		)
	),
	s(
		{
			trig = "bcap",
			name = "Big Intersection",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \bigcap_{<>} 
    ]],
			{ i(1) }
		)
	),
	s(
		{
			trig = "sqcap",
			name = "Disjoint Intersection",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\sqcap  
        ]],
			{}
		)
	),
	s(
		{
			trig = "cup",
			name = "Union",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\cup 
    ]],
			{}
		)
	),
	s(
		{
			trig = "sqcup",
			name = "Disjoint Union",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\sqcup 
        ]],
			{}
		)
	),
	s(
		{
			trig = "bcup",
			name = "Big Union",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \bigcup_{<>} 
    ]],
			{ i(1) }
		)
	),
	s(
		{
			trig = ";x",
			name = "Product",
			description = "Cross Product",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \times 
        ]],
			{}
		)
	),
	s(
		{
			trig = ";ox",
			name = "OTimes",
			description = "Direct Sum",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \otimes 
        ]],
			{}
		)
	),
	-- Relations
	s(
		{
			trig = "iff",
			name = "If And Only If",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \iff 
    ]],
			{}
		)
	),
	s(
		{
			trig = "~=",
			name = "Homeomorphism",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \simeq 
  ]],
			{}
		)
	),
	s(
		{
			trig = "~~",
			name = "Sim tilde",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \sim 
  ]],
			{}
		)
	),
	s(
		{
			trig = "==",
			name = "Equivalent",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \equiv 
  ]],
			{}
		)
	),
	-- Other Symbols
	s(
		{
			trig = "TT",
			name = "Transpose",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  ^\top 
  ]],
			{}
		)
	),
	s(
		{
			trig = "...",
			name = "Dots",
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
    \dots 
    ]],
			{}
		)
	),
	s(
		{
			trig = "v..",
			name = "Vertical Dots",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \vdots 
    ]],
			{}
		)
	),
	s(
		{
			trig = "c..",
			name = "Center Dots",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \cdots 
    ]],
			{}
		)
	),
	s(
		{
			trig = "res",
			name = "Restriction",
			desc = "Big vertical bar with subscript",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
\big|_{<>} 
        ]],
			{ i(1) }
		)
	),
	s(
		{
			trig = ";%.",
			name = "Cdot",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \cdot 
        ]],
			{}
		)
	),
	s(
		{
			trig = ";E",
			name = "Exists",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  \exists 
  ]],
			{}
		)
	),
	s(
		{
			trig = "`o",
			name = "Circ",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \circ 
    ]],
			{}
		)
	),
	s(
		{
			trig = "`p",
			name = "Partial",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \partial 
    ]],
			{}
		)
	),
	s(
		{
			trig = "oo",
			name = "Infinity",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \infty 
    ]],
			{}
		)
	),
	-- Arrows
	s(
		{
			trig = "embed",
			name = "Embedding",
			wordTrig = true,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
          \hookrightarrow 
        ]],
			{}
		)
	),
	s( -- Weakly to
		{
			trig = "wto",
			name = "Right Harpoon Up",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \rightharpoonup 
    ]],
			{}
		)
	),
	s(
		{
			trig = "Larrow",
			name = "Left Big Arrow (Implies)",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \Leftarrow 
    ]],
			{}
		)
	),
	s(
		{
			trig = "larrow",
			name = "Left Arrow (To)",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \leftarrow 
    ]],
			{}
		)
	),
	s(
		{
			trig = "Rarrow",
			name = "Right Big Arrow ",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \Rightarrow 
    ]],
			{}
		)
	),
	s(
		{
			trig = "rarrow",
			name = "Right Arrow ",
			snippetType = "snippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \rightarrow 
    ]],
			{}
		)
	),
	s(
		{
			trig = "to",
			name = "To",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \to 
    ]],
			{}
		)
	),
	s(
		{
			trig = "mto",
			name = "Maps To",
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    \mapsto 
    ]],
			{}
		)
	),
}
