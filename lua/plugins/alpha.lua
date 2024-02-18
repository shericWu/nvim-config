return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local theme = require("alpha.themes.dashboard")

		local function setButton(sc, txt, keybind, keybind_opts)
			local leader = "<SPC>"
			local sc_after = sc:gsub("%s", ""):gsub(leader, "<leader>")

			local opts = {
				position = "center",
				shortcut = sc,
				cursor = 0,
				width = 60,
				align_shortcut = "right",
				hl = "AlphaButtons",
				hl_shortcut = "AlphaShortcut",
				shrink_margin = true,
			}

			if keybind then
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc_after, keybind, keybind_opts }
			end

			local function on_press()
				local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
			end

			return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
			}
		end

		theme.section.buttons.val = {
			setButton("n", ">  󰝒 new file", "<cmd>:ene<CR>"),
			setButton("o", ">  󱋡 recent file", "<cmd>:Telescope oldfiles<CR>"),
			setButton("s", ">  󰙅 file system", "<cmd>:Neotree filesystem right reveal toggle<CR>"),
			setButton("f", ">  󰱼 find files", "<cmd>:Telescope find_files<CR>"),
			setButton("g", ">  󰷊 live grep", "<cmd>:Telescope live_grep<CR>"),
			setButton("m", ">  󱊈 run Mason", "<cmd>:Mason<CR>"),
			setButton("c", ">   check health", "<cmd>:checkhealth<CR>"),
			setButton("t", ">  󰚰 update treesitter", "<cmd>:TSUpdate<CR>"),
			setButton("z", ">  󰚥 open Lazy", "<cmd>:Lazy<CR>"),
		}

		theme.section.header.val = {
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
			[[                                                                       ]],
			[[                                                                       ]],
		}

		-- local function footer()
		-- 	local stats = require("lazy").stats()
		-- 	local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		-- 	return {
		-- 		"  󰀨 ver "
		-- 			.. vim.version().major
		-- 			.. "."
		-- 			.. vim.version().minor
		-- 			.. "."
		-- 			.. vim.version().patch
		-- 			.. "  󰦬 "
		-- 			.. stats.count
		-- 			.. " plugins in "
		-- 			.. ms
		-- 			.. "ms",
		-- 	}
		-- end

		-- theme.section.footer.val = footer()

		theme.config.layout = {
			{ type = "padding", val = 1 },
			theme.section.header,
			{ type = "padding", val = 2 },
			theme.section.buttons,
			{ type = "padding", val = 12 },
			theme.section.footer,
		}

		alpha.setup(theme.opts)

        vim.api.nvim_create_autocmd("User", {
            pattern = "LazyVimStarted",
            callback = function()
                local stats = require("lazy").stats()
                local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

                local version = "  󰀨 ver " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
                local plugins = "  󰦬 loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                local footer = version .. "\t" .. plugins
                theme.section.footer.val = footer
                pcall(vim.cmd.AlphaRedraw)
            end,
        })
	end,
}
