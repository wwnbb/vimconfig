return {
	"mfussenegger/nvim-dap",

	{
		"leoluz/nvim-dap-go",
		config = function()
			require("dap-go").setup({
				-- Additional dap configurations can be added.
				-- dap_configurations accepts a list of tables where each entry
				-- represents a dap configuration. For more details do:
				-- :help dap-configuration
				dap_configurations = {
					{
						type = "go",
						name = "Attach remote",
						mode = "remote",
						request = "attach",
					},
				},
				-- delve configurations
				delve = {
					-- the path to the executable dlv which will be used for debugging.
					-- by default, this is the "dlv" executable on your PATH.
					path = "dlv",
					-- time to wait for delve to initialize the debug session.
					-- default to 20 seconds
					initialize_timeout_sec = 20,
					-- a string that defines the port to start delve debugger.
					-- default to string "${port}" which instructs nvim-dap
					-- to start the process in a random available port.
					-- if you set a port in your debug configuration, its value will be
					-- assigned dynamically.
					port = "${port}",
					-- additional args to pass to dlv
					args = {},
					-- the build flags that are passed to delve.
					-- defaults to empty string, but can be used to provide flags
					-- such as "-tags=unit" to make sure the test suite is
					-- compiled during debugging, for example.
					-- passing build flags using args is ineffective, as those are
					-- ignored by delve in dap mode.
					-- avaliable ui interactive function to prompt for arguments get_arguments
					build_flags = {},
					-- whether the dlv process to be created detached or not. there is
					-- an issue on Windows where this needs to be set to false
					-- otherwise the dlv server creation will fail.
					-- avaliable ui interactive function to prompt for build flags: get_build_flags
					detached = vim.fn.has("win32") == 0,
					-- the current working directory to run dlv from, if other than
					-- the current working directory.
					cwd = nil,
				},
				-- options related to running closest test
				tests = {
					-- enables verbosity when running the test.
					verbose = false,
				},
			})
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		config = function()
			require("dapui").setup({
				icons = { expanded = "▾", collapsed = "▸" },
				mappings = {
					-- Use a table to apply multiple mappings
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					edit = "e",
					repl = "r",
					toggle = "t",
				},
				-- Expand lines larger than the window
				-- Requires >= 0.7
				expand_lines = vim.fn.has("nvim-0.7"),
				layouts = {
					{
						elements = {
							"scopes",
							"breakpoints",
							"stacks",
							"watches",
						},
						size = 40,
						position = "left",
					},
					{
						elements = {
							"repl",
						},
						size = 15,
						position = "bottom",
					},
				},
				floating = {
					max_height = nil, -- These can be integers or a float between 0 and 1.
					max_width = nil, -- Floats will be treated as percentage of your screen.
					border = "single", -- Border style. Can be "single", "double" or "rounded"
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				windows = { indent = 1 },
				render = {
					max_type_length = nil, -- Can be integer or nil.
				},
				controls = {
					-- Requires Neovim nightly (or 0.8 when released)
					enabled = true,
					-- Display controls in this element
					element = "repl",
					icons = {
						pause = "",
						play = "",
						step_into = "",
						step_over = "",
						step_out = "",
						step_back = "",
						run_last = "",
						terminate = "ﭦ",
					},
				},
			})

			local dap, dapui = require("dap"), require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#993939", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61afef", bg = "#31353f" })
			vim.api.nvim_set_hl(0, "DapStopped", { fg = "#98c379", bg = "#31353f" })

			vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define(
				"DapBreakpointCondition",
				{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define(
				"DapBreakpointRejected",
				{ text = "", texthl = "DapBreakpoint", linehl = "DapBreakpoint", numhl = "DapBreakpoint" }
			)
			vim.fn.sign_define("DapLogPoint", {
				text = "",
				texthl = "DapLogPoint",
				linehl = "DapLogPoint",
				numhl = "DapLogPoint",
			})
			vim.fn.sign_define(
				"DapStopped",
				{ text = "", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" }
			)
		end,
	},

	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require("dap-python").setup("~/.virtualenvs/debugpy/bin/python")
		end,
	},

	{
		"theHamsta/nvim-dap-virtual-text",
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
