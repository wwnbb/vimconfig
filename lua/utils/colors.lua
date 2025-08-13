local M = {}

local colors_base = {
	base03 = "#002b36",
	base02 = "#073642",
	base01 = "#586e75",
	base00 = "#657b83",
	base0 = "#839496",
	base1 = "#93a1a1",
	base2 = "#eee8d5",
	base3 = "#fdf6e3",
	yellow = "#b58900",
	orange = "#cb4b16",
	red = "#dc322f",
	dark_red = "#7A0000",
	light_red = "#f9cfbe",
	magenta = "#d33682",
	violet = "#6c71c4",
	blue = "#268bd2",
	cyan = "#2aa198",
	green = "#859900",
	light_green = "#d0d9a4",
	very_dark_green = "#034010",
}

M.colorscheme = {
	colors_dark = {
		diff_green = colors_base.very_dark_green,
		diff_red = colors_base.dark_red,
		text_gray = colors_base.base00,
		text = colors_base.base1, -- background areas
		text_highlight = colors_base.base2, -- highlighted/selected text
		background = colors_base.base02, -- emphasized content
		yellow = colors_base.yellow,
		orange = colors_base.orange,
		red = colors_base.red,
		magenta = colors_base.magenta,
		violet = colors_base.violet,
		blue = colors_base.blue,
		cyan = colors_base.cyan,
		green = colors_base.green,
	},
	-- Color assignments for light theme
	colors_light = {
		diff_green = colors_base.light_green,
		diff_red = colors_base.light_red,
		text_gray = colors_base.base00,
		text = colors_base.base01,
		text_highlight = colors_base.base02,
		background = colors_base.base2,
		yellow = colors_base.yellow,
		orange = colors_base.orange,
		red = colors_base.red,
		magenta = colors_base.magenta,
		violet = colors_base.violet,
		blue = colors_base.blue,
		cyan = colors_base.cyan,
		green = colors_base.green,
	},
}

M.get_colors = function()
	local is_dark = vim.go.background == "dark"
	return is_dark and M.colorscheme.colors_dark or M.colorscheme.colors_light
end

return M
