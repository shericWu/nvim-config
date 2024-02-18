-- set tabs as 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- show line numbers and highlight cursor line
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"

-- set leader key to space
vim.g.mapleader = " "

-- set signcolumn behavior
vim.opt.signcolumn = "number" -- or "yes:4"

-- set the window for key pressed
vim.opt.timeoutlen = 300

-- set cursor style
vim.opt.guicursor="n-c:block,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o-v-sm:hor20"
