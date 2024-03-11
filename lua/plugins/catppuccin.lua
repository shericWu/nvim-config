return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,

	config = function()
		local catppuccin = require("catppuccin")
		catppuccin.setup({
			transparent_background = true,
			integrations = {
				telescope = {
					enabled = true,
				},
				notify = true,
                dap = true,
                cmp = true,
                noice = false,
                mason = false,
                neotree = false,
			},
		})
		vim.cmd.colorscheme("catppuccin")
		vim.cmd.highlight({ "LineNr", "guifg=#6c83ac" })
	end,
}
