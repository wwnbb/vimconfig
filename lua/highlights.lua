local color_utils = require("utils.colors")
local colors = color_utils.get_colors() or {}

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		colors = color_utils.get_colors()
		vim.api.nvim_set_hl(0, "DiffDelete", { bg = colors.diff_red })
		vim.api.nvim_set_hl(0, "DiffAdd", { bg = colors.diff_green })
		vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#7b62a3" })
		vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#df2325" })

		vim.api.nvim_set_hl(0, "Pmenu", { link = "Normal" })
		vim.api.nvim_set_hl(0, "PmenuSel", { link = "CursorLine" })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { underdotted = true })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#d0d9a4" })
		vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#d0d9a4" })
		vim.api.nvim_set_hl(0, "Visual", { reverse = true, bg = "#002b36" })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#000000", fg = "#FFFFFF" })
		vim.api.nvim_set_hl(0, "@variable", { fg = "#586e75" })

		vim.api.nvim_set_hl(0, "OpenCodeInputBg", { bg = colors.background_light })
	end,
})

-- ###################### COLORS ########################

vim.cmd([[hi CmpItemKind guifg=#839496 guibg=#fdf6e3]])

vim.cmd([[hi CmpItemAbbrMatch guifg=#b58900 guibg=#fdf6e3]])
vim.cmd([[hi CmpItemAbbrMatchFuzzy guifg=#b58900 guibg=#fdf6e3]])
-- vim.cmd([[hi TelescopeSelection guibg=#7370d4 guifg=#000000]])

vim.opt.fillchars = { diff = "╌" }

vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescriptreact",
	callback = function(_)
		vim.cmd([[highlight link @tag NONE]])
	end,
})
