return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			{ "fredrikaverpil/neotest-golang", version = "*" },
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-golang")({
						runner = "gotestsum",
					}),

					require("neotest-python")({
						runner = "pytest",

						python = ".venv/bin/python",

						dap = { justMyCode = false },

						is_test_file = function(file_path)
							if not vim.endswith(file_path, ".py") then
								return false
							end
							local elems = vim.split(file_path, Path.path.sep)
							local file_name = elems[#elems]
							return vim.startswith(file_name, "test_")
								or vim.endswith(file_name, "_test.py")
								or vim.endswith(file_name, "_test.py")
						end,
					}),
				},
				icons = {
					child_indent = "│",
					child_prefix = "├",
					collapsed = "─",
					expanded = "╮",
					failed = "✖",
					final_child_indent = " ",
					final_child_prefix = "╰",
					non_collapsible = "─",
					passed = "✔",
					running = "",
					skipped = "☇",
					unknown = "?",
				},
			})
		end,
	},
}
