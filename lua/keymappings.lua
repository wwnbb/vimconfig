local tailwind_classes_fold = require('tailwind-classes-fold')
local keyset = vim.keymap.set


local function toggle_star_selection()
  if vim.fn.getreg('/') ~= '' then
    vim.fn.setreg('/', '')
  else
    pcall(vim.cmd, 'normal! mi*`i<CR>')
  end
end

-- Map the * key to call the toggle_star_selection function
keyset('n', '*', toggle_star_selection, { noremap = true, silent = true })


vim.cmd('nnoremap <silent> # :nohl<CR>')

local api = require("nvim-tree.api")

local function explore()
  -- path = vim.fn.expand("%")
  api.tree.toggle({ find_file = true, focus = true, path = "<arg>" })
end

keyset('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })


keyset('n', '<space>n', explore, { noremap = true, silent = true })


local function plenary_test_file()
  require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
end

keyset('n', '<space>tl', plenary_test_file, { noremap = true })


keyset('n', 'zt', function()
  tailwind_classes_fold.toggle_conceal()
end)

keyset('n', '<space>r', vim.lsp.buf.rename, {})
