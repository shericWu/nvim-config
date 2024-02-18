-- set tabs as 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- show line numbers and highlight cursor line
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.relativenumber = true

-- set leader key to space
vim.g.mapleader = " "

-- set signcolumn behavior
vim.opt.signcolumn = "number" -- or "yes:4"

-- set the window for key pressed
vim.opt.timeoutlen = 300

-- set cursor style
vim.opt.guicursor = "n-c:block,i-ci-ve:ver25-blinkwait700-blinkoff400-blinkon250,r-cr-o-v-sm:hor20"

-- ask when closing file with unsaved changes
vim.opt.confirm = true

-- keymap
vim.keymap.set("n", "<C-b>n", "<cmd>bn<CR>", {})
vim.keymap.set("n", "<C-b>p", "<cmd>bN<CR>", {})
vim.keymap.set("n", "<C-t>n", "<cmd>tabnew<CR>", {})
vim.keymap.set("n", "<C-t>q", "<cmd>tabclose<CR>", {})
