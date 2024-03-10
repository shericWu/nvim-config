return {
	{
		"tpope/vim-fugitive",
	},
	{
		"rbong/vim-flog",
		lazy = true,
		cmd = { "Flog", "Flogsplit", "Floggit" },
		dependencies = {
			"tpope/vim-fugitive",
		},
	},
	{
		"lewis6991/gitsigns.nvim",

		config = function()
			require("gitsigns").setup()
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
		end,
	},
    {
        "sindrets/diffview.nvim",
        config  = function()
            require("diffview").setup()
        end,
    },
}
