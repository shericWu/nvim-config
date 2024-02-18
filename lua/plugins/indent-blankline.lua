return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},

	config = function()
		local myHighlight = {
			"scopeHighlight",
		}
		local hooks = require("ibl.hooks")
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "scopeHighlight", { fg = "#566176" })
		end)

		require("ibl").setup({
			indent = {
				char = "▏",
			},
			scope = {
				highlight = myHighlight,
				show_start = false,
			},
		})
	end,
}
