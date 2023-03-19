local api = vim.api


api.nvim_create_autocmd("FileType",
  { pattern = { "help", "startuptime", "lspinfo", "neotest-output"}, command = [[nnoremap <buffer><silent> q :close<CR>]] }
  )

api.nvim_create_autocmd("BufWritePre", {
    buffer = buffer,
    callback = function()
      vim.lsp.buf.format { async = false }
    end
  })


vim.g.copilot_filetypes = {
  ['*'] = false,
  ['javascript'] = true,
  ['typescript'] = true,
  ['vue'] = true,
  ['lua'] = true,
  ['html'] = true,
  ['python'] = true,
  ['go'] = true,
  ['golang'] = true,
}

vim.g.copilot_no_tab_map = true


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
vim.opt.termguicolors = true
vim.opt.background = "light"
vim.cmd("colorscheme NeoSolarized")

-- crontab filetype tweak
vim.cmd([[au FileType crontab setlocal bkc=yes]])

-- fix jump
vim.api.nvim_set_keymap('n', '*', ':let @/= \'<\' . expand(\'<cword>\') . \'>\' <bar> set hls <cr>', {noremap = true, silent = true})

vim.opt.hidden = true

-- terminal settings
vim.cmd([[autocmd BufWinEnter,WinEnter term://* startinsert]])
vim.cmd([[autocmd BufLeave term://* stopinsert]])

-- LANGUAGE SPECIFIC
vim.cmd([[au BufNewFile,BufRead *.py setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])
vim.cmd([[au BufNewFile,BufRead *.lua setlocal et ts=2 sw=2 sts=2]])

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.cmd([[autocmd BufReadPost,FileReadPost * normal zR]])

-- ###################### COLORS ########################
vim.cmd([[hi NeotestPassed guifg=#859900]])
vim.cmd([[hi NeotestFailed guifg=#F70067]])
vim.cmd([[hi NeotestRunning guifg=#268bd2]])
vim.cmd([[hi NeotestSkipped guifg=#2aa198]])
vim.cmd([[hi NeotestFile guifg=#859900]])
vim.cmd([[hi NeotestDir guifg=#268bd2]])
vim.cmd([[hi NeotestNamespace guifg=#d33682]])
vim.cmd([[hi NeotestFocused gui=bold,underline cterm=bold,underline]])
vim.cmd([[hi NeotestIndent guifg=#8B8B8B]])
vim.cmd([[hi NeotestExpandMarker guifg=#8094b4]])
vim.cmd([[hi NeotestAdapterName guifg=#F70067]])
vim.cmd([[hi NeotestWinSelect guifg=#00f1f5 gui=bold]])
vim.cmd([[hi NeotestMarked guifg=#F79000 gui=bold]])
vim.cmd([[hi NeotestTarget guifg=#F70067]])
vim.cmd([[hi NeotestTest guifg=#657b83]])

vim.cmd([[hi CmpItemKind guifg=#839496 guibg=#fdf6e3]])

vim.cmd([[hi CmpItemAbbrMatch guifg=#b58900 guibg=#fdf6e3]])
vim.cmd([[hi CmpItemAbbrMatchFuzzy guifg=#b58900 guibg=#fdf6e3]])

-- Disable built-in providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Set Python 3 host program
vim.g.python3_host_prog = "/Users/admin/.config/nvim/.venv/bin/python"

