return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline",
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
			hover = {
				silent = true,
			},
		},
		presets = {
			bottom_search = true,
			command_palette = false,
			long_message_to_split = true,
			inc_rename = false,
			lsp_doc_border = true,
		},
		messages = {
			enabled = false,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
}
