require("nvim_comment").setup()

require("mini.surround").setup()

require("mini.pairs").setup()

require("colorizer").setup({
	filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	options = {
		parsers = {
			tailwind = {
				enable = true,
				mode = "background",
			},
			css = true,
		},
	},
})

require("dark_notify").run({
	schemes = {
		-- you can use a different colorscheme for each
		dark = "solarized",
		-- even a different `set background=light/dark` setting or lightline theme
		-- if you use lightline, you may want to configure lightline themes,
		-- even if they're the same one, especially if the theme reacts to :set bg
		light = {
			colorscheme = "solarized",
		},
	},
})
