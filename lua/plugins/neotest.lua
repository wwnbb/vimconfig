-- Autocommand for theme switching
local color_utils = require("utils.colors")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "neotest-summary",
	callback = function(_)
		local colors = color_utils.get_colors()
		vim.cmd("hi NeotestPassed guifg=" .. colors.green)
		vim.cmd("hi NeotestFailed guifg=" .. colors.red)
		vim.cmd("hi NeotestRunning guifg=" .. colors.blue)
		vim.cmd("hi NeotestSkipped guifg=" .. colors.text_gray)
		vim.cmd("hi NeotestFile guifg=" .. colors.cyan)
		vim.cmd("hi NeotestDir guifg=" .. colors.orange)
		vim.cmd("hi NeotestNamespace guifg=" .. colors.magenta)
		vim.cmd([[hi NeotestFocused gui=bold,underline cterm=bold,underline]])
		vim.cmd("hi NeotestIndent guifg=" .. colors.magenta)
		vim.cmd("hi NeotestExpandMarker guifg=" .. colors.blue)
		vim.cmd("hi NeotestAdapterName guifg=" .. colors.violet)
		vim.cmd("hi NeotestWinSelect gui=bold guifg=" .. colors.red)
		vim.cmd("hi NeotestMarked  gui=bold guifg=" .. colors.yellow)
		vim.cmd("hi NeotestTarget guifg=" .. colors.green)
		vim.cmd("hi NeotestTest guifg=" .. colors.green)
	end,
})

return {
	{
		"nvim-neotest/neotest",
		version = "v5.8.0",
		dependencies = {
			{ "nvim-neotest/nvim-nio", version = "v1.9.4" },
			{ "nvim-lua/plenary.nvim", version = "*" },
			{ "antoinemadec/FixCursorHold.nvim", version = "*" },
			{ "nvim-treesitter/nvim-treesitter", version = "*" },
			{ "nvim-neotest/neotest-python" },
			{ "fredrikaverpil/neotest-golang", version = "v1.9.2" },
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
