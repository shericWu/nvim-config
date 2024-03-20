return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
            "nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
		},

		config = function()
			require("dapui").setup()
			local dap = require("dap")
			local dapui = require("dapui")

			dap.adapters.codelldb = {
				type = "server",
				host = "127.0.0.1",
				port = "${port}",
				executable = {
					command = "/home/shericwu/.local/share/nvim/mason/bin/codelldb",
					args = { "--port", "${port}" },
				},
			}

			dap.configurations.c = {
				{
					name = "Launch Debug Codelldb",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
			dap.configurations.cpp = dap.configurations.c

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, {})
			vim.keymap.set("n", "<F2>", dap.continue, {})
			vim.keymap.set("n", "<F3>", dap.step_over, {})
			vim.keymap.set("n", "<F4>", dap.step_into, {})
			vim.keymap.set("n", "<F5>", dap.step_out, {})
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",

		config = function()
			require("nvim-dap-virtual-text").setup({
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				clear_on_continue = false, -- clear virtual text on "continue" (might cause flickering when stepping)
				-- A callback that determines how a variable is displayed or whether it should be omitted
				-- @param variable Variable https://microsoft.github.io/debug-adapter-protocol/specification#Types_Variable
				-- @param buf number
				-- @param stackframe dap.StackFrame https://microsoft.github.io/debug-adapter-protocol/specification#Types_StackFrame
				-- @param node userdata tree-sitter node identified as variable definition of reference (see `:h tsnode`)
				-- @param options nvim_dap_virtual_text_options Current options for nvim-dap-virtual-text
				-- @return string|nil A text how the virtual text should be displayed or nil, if this variable shouldn't be displayed
				display_callback = function(variable, buf, stackframe, node, options)
					if options.virt_text_pos == "inline" then
						return " = " .. variable.value
					else
						return variable.name .. " = " .. variable.value
					end
				end,
				-- position of virtual text, see `:h nvim_buf_set_extmark()`, default tries to inline the virtual text. Use 'eol' to set to end of line
				virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			})
		end,
	},
}
