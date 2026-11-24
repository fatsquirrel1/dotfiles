---@diagnostic disable global: ls, s, sn, t, i, f, c, d, r, l, rep, p, m, n, dl, fmt, fmta, types, conds, conds_expand

return {
	s(
		{ trig = "snippet", name = "Snippet", snippetType = "snippet" },
		fmta(
			[=[
						s(
						{
								trig = "<>",
								name = "<>",
								wordTrig = <>,
								regTrig = <>,
								snippetType = "<>snippet",
								condition = <>in_mathzone,
								show_condition = <>,
							},
						fmta(
						[[
										<>
									]],
						{
								<>
							}
						)
						),
					]=],
			{
				i(1, "trigger"),
				i(2, "name"),
				c(3, { t("true"), t("false") }),
				c(4, { t("false"), t("true") }),
				c(5, { t("auto"), t("") }),
				c(6, { t(""), t("not_") }),
				c(7, { t("true"), t("false") }),
				i(8, "snippet"),
				c(9, { t(""), t("i(0)") }),
			},
			{ delimiters = "<>" }
		)
	),
}
