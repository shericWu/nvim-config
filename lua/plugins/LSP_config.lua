return {
	{
		"williamboman/mason.nvim",

		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",

		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"clangd",
					"marksman",
					"bashls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- for cmp-nvim-lsp
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")
			-- set up LSP for each language
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			lspconfig.marksman.setup({
				capabilities = capabilities,
			})
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})

			-- config floating window border
			local myBorder = "rounded"
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = myBorder,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signatre_help, {
				border = myBorder,
			})

			require("lspconfig.ui.windows").default_options = {
				border = myBorder,
			}

			vim.diagnostic.config({
				virtual_text = false,
				float = { border = myBorder },
				signs = true,
				severity_sort = true,
			})

			-- set shortcuts
			--            vim.keymap.set({'n', 'v'}, '<leader>dd', vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>df", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "<leader>dc", vim.lsp.buf.declaration, {})
            -- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set('n', '<leader>ip', vim.lsp.buf.implementation, {})
			--            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"nvimdev/lspsaga.nvim",

		config = function()
			require("lspsaga").setup({
				diagnostic = {
					max_width = 0.6,
					max_height = 0.4,
					max_show_width = 0.6,
					max_show_height = 0.4,
					keys = {
						quit = { "q", "<ESC>" },
					},
				},
				finder = {
					default = "ref+imp+def",
					max_height = 0.6,
					keys = {
						tabnew = "<CR>",
						vsplit = "v",
						split = "s",
						close = "<ESC>",
					},
				},
				hover = {
					max_width = 0.6,
					max_height = 0.4,
					open_link = "ll",
				},
				lightbulb = {
					enable = true,
					sign = false,
					virtual_text = true,
				},
				outline = {
					detail = false,
					layout = "normal",
					max_height = 0.6,
					left_width = 0.2,
					keys = {
						jump = "<CR>",
					},
				},
				rename = {
					keys = {
						quit = "<ESC>",
					},
				},
			})

			vim.keymap.set("n", "<leader>dd", "<cmd>Lspsaga diagnostic_jump_next<CR>", {})
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {})
			vim.keymap.set("n", "<leader>ol", "<cmd>Lspsaga outline<CR>", {})
			vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", {})
			vim.keymap.set("n", "<leader>fd", "<cmd>Lspsaga finder<CR>", {})
		end,
	},
}
