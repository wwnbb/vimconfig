return {
	{
		"nvim-neotest/neotest",
		version = "*",
		dependencies = {
			{ "nvim-neotest/nvim-nio", version = "*" },
			{ "nvim-lua/plenary.nvim", version = "*" },
			{ "antoinemadec/FixCursorHold.nvim", version = "*" },
			{ "nvim-treesitter/nvim-treesitter", version = "*" },
			{ "nvim-neotest/neotest-python" },
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
