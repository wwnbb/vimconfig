local vim = vim
local api = vim.api
local opt = vim.opt
vim.o.exrc = true

api.nvim_create_autocmd("FileType", {
	pattern = { "help", "startuptime", "lspinfo", "neotest-output", "toggleterm", "fugitive" },
	command = [[nnoremap <buffer><silent> q :close<CR>]],
})

-- Disable highlight on lsp hover
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = function()
		vim.api.nvim_set_hl(0, "LspReferenceTarget", {})
	end,
})

-- No more stupid wrapping
vim.opt.wrap = false
-- Dont create swap file
vim.opt.swapfile = false
-- Copies using system clipboard
vim.opt.clipboard = "unnamed,unnamedplus"
-- highlights current line
vim.opt.cursorline = true
-- Keep your cursor centered vertically on the screen
vim.opt.scrolloff = 20
vim.opt.pumheight = 19

-- Tab = 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.softtabstop = 4

-- enable mouse support
vim.opt.mouse = "a"
vim.opt.mousemodel = "popup"

-- markdown file recognition
vim.cmd([[autocmd BufNewFile,BufReadPost *.md set filetype=markdown]])

-- relative line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set colors in terminal
-- vim.opt.termguicolors = true
-- vim.opt.background = "light"
-- vim.cmd("colorscheme NeoSolarized")

-- crontab filetype tweak
vim.cmd([[au FileType crontab setlocal bkc=yes]])

vim.opt.hidden = true

-- terminal settings
vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
vim.cmd([[autocmd BufLeave term://* stopinsert]])

-- LANGUAGE SPECIFIC
vim.cmd([[au BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
vim.cmd([[au BufNewFile,BufRead *.lua setlocal et ts=2 sw=2 sts=2]])

vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])

-- Disable built-in providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Set Python 3 host program
vim.g.python3_host_prog = "/Users/admin/.config/nvim/.venv/bin/python"

opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd([[set nofoldenable]])

-- clean up search highlighting
vim.fn.setreg("/", "")

-- Diagnostics border
vim.diagnostic.config({
	float = {
		border = "rounded",
		source = "always",
	},
	virtual_text = {
		source = "always",
		prefix = "●", -- Could be '■', '▎', 'x'
	},
	severity_sort = true,
	update_in_insert = true,
})

vim.g.copilot_filetypes = {
	["*"] = true,
	python = true,
	javascript = true,
	typescript = true,
	typescriptreact = true,
	javascriptreact = true,
	html = true,
	css = true,
	scss = true,
	sass = true,
	go = true,
	rust = true,
	c = true,
	cpp = true,
	java = true,
	lua = true,
	vim = true,
}
