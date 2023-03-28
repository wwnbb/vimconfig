local keyset = vim.keymap.set

-- keyset('n', '*', ":let @/= \'<\' . expand(\'<cword>\') . \'>\' <bar> set hls <cr>", { noremap = true })

vim.cmd('nnoremap <silent> * :keepjumps normal! mi*`i<CR>')

vim.cmd('nnoremap <silent> # :nohl<CR>')

local api = require("nvim-tree.api")

local function explore()
  -- path = vim.fn.expand("%")
  api.tree.toggle({ find_file = true, focus = true, path = "<arg>" })
end

local function show_lsp_documentation()
  vim.lsp.buf.hover()
end
keyset('n', 'K', show_lsp_documentation, { noremap = true, silent = true })


keyset('n', '<space>n', explore, { noremap = true, silent = true })
