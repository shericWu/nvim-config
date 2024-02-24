local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
    -- [maths]
	s(
		{ trig = "mm" },
		fmta(
			[[
                $$
                    <>
                $$
            ]],
			{
				i(0),
			}
		)
	),
    -- [math functions]
	s(
		{ trig = "ff" },
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
		{ trig = "sqrt" },
		fmta(
			[[
                \sqrt{<>}
            ]],
			{
				i(1),
			}
		)
	),
	s(
		{ trig = "sqrtN" },
		fmta(
			[[
                \sqrt[<>]{<>}
            ]],
			{
				i(1),
                i(2),
			}
		)
	),
    -- [text]
	s(
		{ trig = "tt" },
		fmta(
			[[
                \text{<>}
            ]],
			{ i(1) }
		)
	),
	s(
		{ trig = "spa" },
		fmta(
			[[
                \ \ \ \ <>
            ]],
			{ i(0) }
		)
	),
    -- [environment]
	s(
		{ trig = "env" },
		fmta(
			[[
                \begin{<>}
                    <>
                \end{<>}
            ]],
			{
				i(1),
				i(2),
				rep(1),
			}
		)
	),
	s(
		{ trig = "cases" },
		fmta(
			[[
                \begin{cases}
                    <>  &<> \\
                    <>  &<>
                \end{cases}
            ]],
			{
				i(1),
				i(2),
                i(3),
                i(4)
			}
		)
	),
}
