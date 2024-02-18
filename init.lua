-- set nvim options in nvim_options.lua
require("nvim_options")

-- for lazy pluging manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	spec = { { import = "plugins" } },
    ui = {
        border = "rounded"
    },
	checker = {
		enabled = true,
	},
})

-- **[shortcuts]**
-- telescope
-- 'n',         '<leader>ff',   find_files
-- 'n',         '<leader>lg',   live_grep
-- neo-tree
-- 'n',         '<leader>fs',   filesystem
-- LSP
-- 'n',         '<leader>ca',   vim.lsp.buf.code_action
-- 'n',         '<leader>df',   vim.lsp.buf.definition
-- 'n',         '<leader>dc',   vim.lsp.buf.declaration

-- 'n',         'K',            Lspsaga hover_doc
-- 'n',         '<leader>dd',   Lspsaga diagnostic_jump_next
-- 'n',         '<leader>rn',   Lspsaga rename
-- 'n',         '<leader>ol',   Lspsaga outline
-- 'n',         '<leader>fd',   Lspsaga finder
-- none-ls
-- n,           '<leader>fm',   format
