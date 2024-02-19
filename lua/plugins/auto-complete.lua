return {
	{
		"onsails/lspkind.nvim",
	},
	{
		"hrsh7th/cmp-nvim-lsp",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",

		config = function()
			local lspkind = require("lspkind")
			require("luasnip.loaders.from_vscode").lazy_load()

			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
                -- [works best]
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehaviorReplace }),
					-- ["<CR>"] = luasnip.expand(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						else
							fallback()
						end
					end),
				}),
                
                -- [my 2nd try]
				-- mapping = cmp.mapping.preset.insert({
				-- 	["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehaviorReplace }),
				-- 	["<Tab>"] = cmp.mapping(function(fallback)
                --         if luasnip.expand_or_jumpable() then
				-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 		-- if cmp.visible() then
				-- 		-- 	cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
				-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end),
				-- }),
                
                -- [from doc]
				-- mapping = cmp.mapping.preset.insert({
				-- 	["<Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_next_item()
				-- 		elseif luasnip.expand_or_locally_jumpable() then
				-- 			luasnip.expand_or_jump()
				-- 		elseif has_words_before() then
				-- 			cmp.confirm({ select = false })
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),

				-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
				-- 		if cmp.visible() then
				-- 			cmp.select_prev_item()
				-- 		elseif luasnip.jumpable(-1) then
				-- 			luasnip.jump(-1)
				-- 		else
				-- 			fallback()
				-- 		end
				-- 	end, { "i", "s" }),
				-- }),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol", -- show only symbol annotations
						maxwidth = function() -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
							return math.floor(0.4 * vim.o.columns)
						end,
						-- can also be a function to dynamically calculate max width such as
						-- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
						ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
						show_labelDetails = true, -- show labelDetails in menu. Disabled by default

						-- The function below will be called before any actual modifications from lspkind
						-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
						before = function(entry, vim_item)
							-- ...
							vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
							return vim_item
						end,
					}),
				},
			})
		end,
	},
}
