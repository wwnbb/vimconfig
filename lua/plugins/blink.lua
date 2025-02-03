local border_chars_outer_thick = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "v0.*",
	enabled = function()
		return not vim.tbl_contains({ "typr" }, vim.bo.filetype)
			and vim.bo.buftype ~= "prompt"
			and vim.b.completion ~= false
	end,

	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		completion = {
			list = {
				selection = { preselect = false, auto_insert = true },
			},
			menu = {
				border = border_chars_outer_thick,
				enabled = true,
				min_width = 30,
				max_height = 15,
				winblend = 0,
			},
		},
		signature = { window = { border = border_chars_outer_thick } },
	},
}
