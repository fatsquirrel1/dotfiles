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
			trig = "([%a%$%}%]%)]) ([%-%.%,%:%?%!])",
			name = "Autofix after delimiters and $",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = function()
				return not in_mathzone()
			end,
			show_condition = false,
		},
		fmta(
			[[
          <><>
        ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
				f(function(_, snip)
					return snip.captures[2]
				end),
			}
		)
	),
	s(
		{
			trig = "([%w%-%+%#])'",
			name = "Auto-Superscript",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			show_condition = false,
		},
		fmta(
			[[
        ^<>
      ]],
			{
				f(function(_, snip)
					if snip.captures[1] == "#" then
						return "\\#"
					elseif snip.captures[1] == "o" then
						return "o"
					else
						return snip.captures[1] .. " "
					end
				end),
			}
		)
	),
	s(
		{
			trig = '"',
			name = "Superscript {}",
			wordTrig = false,
			regTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
  ^{<>} 
  ]],
			{
				i(1),
			}
		)
	),
	s(
		{
			trig = "?", -- cannot be '', conflicts with primes
			name = "Subscript {}",
			wordTrig = false,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
    _{<>} 
    ]],
			{ i(1) }
		)
	),
	s(
		{
			trig = "([%w%-%+%#])/",
			name = "Auto-Subscript",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
		},
		fmta(
			[[
        _<> 
      ]],
			{
				f(function(_, snip)
					if snip.captures[1] == "#" then
						return "\\#"
					else
						return snip.captures[1]
					end
				end),
			}
		)
	),
	s(
		{
			trig = ";d(%a)",
			name = "Integral dx",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			show_condition = false,
		},
		fmta(
			[[
    \:\mathrm d <>
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
	s(
		{
			trig = "ff",
			name = "fraction",
			wordTrig = false,
			regTrig = true,
			snippetType = "autosnippet",
			condition = in_mathzone,
			priority = 9999,
		},
		fmta(
			[[
      \frac{<>}{<>} 
      ]],
			{
				i(1),
				i(2),
			}
		)
	),
	s(
		{
			trig = "ol(.)",
			name = "Overline",
			wordTrig = false,
			regTrig = true,
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				return (in_mathzone() and current.name ~= "\\overline")
			end,
			snippetType = "autosnippet",
		},
		fmta(
			[[
\overline{<><>} 
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
			trig = "rm(%a)",
			name = "Math Remove",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				if current.name == "\\mathrm" or not in_mathzone() then
					return false
				end
				return true
			end,
			priority = 9998,
		},
		fmta(
			[[
    \mathrm{<><>} 
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
			trig = "(%a)rm",
			name = "Math Remove (1)",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			condition = function()
				local current = vim.fn["vimtex#cmd#get_current"]()
				if current.name == "\\mathrm" or not in_mathzone() then
					return false
				end
				return true
			end,
		},
		fmta(
			[[
    \mathrm{<>} 
    ]],
			{
				f(function(_, snip)
					return snip.captures[1]
				end),
			}
		)
	),
}
