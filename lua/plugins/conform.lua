return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },

	keys = {
		{
			-- Customize or remove this keymap to your liking
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = {
		format_on_save = {},
		formatters_by_ft = {
			lua = { "stylua" },
			python = {"isort" },
			go = { "gofmt", "goimports" },
			['*'] = { "trim_whitespace" },
		},
		-- Set default options
		default_format_opts = {
			lsp_format = "fallback",
		},
	},
}
