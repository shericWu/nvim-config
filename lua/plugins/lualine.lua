return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local myNord = require("lualine.themes.gruvbox")
		local colors = {
			night0 = "#2e3440",
			night1 = "#3b4252",
			night2 = "#434c5e",
			night3 = "#4c566a",

			snow4 = "#d8dee9",
			snow5 = "#e5e9f0",
			snow6 = "#eceff4",

			frost7 = "#8fbcbb",
			frost8 = "#88c0d0",
			frost9 = "#81a1c1",
			frost10 = "#5e81ac",

			aurora11 = "#bf616a",
			aurora12 = "#d08770",
			aurora13 = "#ebcb8b",
			aurora14 = "#a3be8c",
			aurora15 = "#b48ead",
		}

		myNord.normal.a.bg = colors.snow4
		myNord.normal.a.fg = colors.night1
		myNord.normal.b.bg = colors.night2
		myNord.normal.b.fg = colors.snow5
		myNord.normal.c.bg = colors.night0
		myNord.normal.c.fg = colors.snow4

		myNord.insert.a.bg = colors.frost8
		myNord.insert.a.fg = colors.night0
		myNord.insert.b.bg = colors.night2
		myNord.insert.b.fg = colors.snow5
		myNord.insert.c.bg = colors.night0
		myNord.insert.c.fg = colors.snow4

		myNord.visual.a.bg = colors.aurora14
		myNord.visual.a.fg = colors.night0
		myNord.visual.b.bg = colors.night2
		myNord.visual.b.fg = colors.snow5
		myNord.visual.c.bg = colors.night0
		myNord.visual.c.fg = colors.snow4

		myNord.replace.a.bg = colors.aurora13
		myNord.replace.a.fg = colors.night0
		myNord.replace.b.bg = colors.night2
		myNord.replace.b.fg = colors.snow5
		myNord.replace.c.bg = colors.night0
		myNord.replace.c.fg = colors.snow4

		myNord.command.a.bg = colors.frost7
		myNord.command.a.fg = colors.night0
		myNord.command.b.bg = colors.night2
		myNord.command.b.fg = colors.snow5
		myNord.command.c.bg = colors.night0
		myNord.command.c.fg = colors.snow4

		myNord.inactive.a.bg = colors.night0
		myNord.inactive.a.fg = colors.snow4
		myNord.inactive.b.bg = colors.night0
		myNord.inactive.b.fg = colors.snow4
		myNord.inactive.c.bg = colors.night0
		myNord.inactive.c.fg = colors.snow4

		require("lualine").setup({
			options = {
				theme = myNord,
			},
			sections = {
				lualine_x = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
						color = { fg = colors.aurora11 },
					},
				},
			},
		})
	end,
}
