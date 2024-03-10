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

		config = function()
			require("luasnip").config.set_config({
				enable_autosnippets = true,
				store_selection_keys = "<Tab>",
				update_events = "TextChanged,TextChangedI",
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",

		config = function()
			local lspkind = require("lspkind")
			-- require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/LuaSnip/" })

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
				experimental = {
					ghost_text = true,
				},
				view = {
					docs = {
						auto_open = true,
					},
				},

				-- [good]
				-- try to combine luasnip into it
				mapping = cmp.mapping.preset.insert({
					["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehaviorReplace }),
					["<C-L>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if #cmp.get_entries() == 1 then
								cmp.confirm({ select = true, behavior = cmp.ConfirmBehaviorReplace })
							end
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif luasnip.jumpable(1) then
							luasnip.jump_next()
						else
							fallback()
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
						elseif luasnip.jumpable(-1) then
							luasnip.jump_prev()
						else
							fallback()
						end
					end),
				}),

				sources = cmp.config.sources({
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
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
