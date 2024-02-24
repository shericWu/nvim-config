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
	-- Example: how to set snippet parameters
	-- require("luasnip").snippet(
	-- 	{ -- Table 1: snippet parameters
	-- 		trig = "hiab",
	-- 		priority = 100,
	-- 		-- snippetType="autosnippet"
	-- 	},
	-- 	{ -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
	-- 		t("Hello, world! AB!"), -- A single text node
	-- 	}
	-- 	-- Table 3, the advanced snippet options, is left blank.
	-- ),
	s({
		trig = "tt",
	}, {
		t("\\texttt{"),
		i(1),
		t("}"),
	}),
	s({
		trig = "ff",
	}, {
		t("\\frac{"),
		i(1),
		t("}{"),
		i(2),
		t("}"),
	}),
}
