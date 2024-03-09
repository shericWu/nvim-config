return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>ud", "<cmd>UndotreeToggle<CR>", {})
	end,
}
