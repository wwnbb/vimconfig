local keyset = vim.keymap.set


local function toggle_star_selection()
    if vim.fn.getreg('/') ~= '' then
        vim.fn.setreg('/', '')
    else
        pcall(vim.cmd, 'normal! mi*`i<CR>')
    end
end

-- Map the * key to call the toggle_star_selection function
keyset('n', '*', toggle_star_selection, {noremap = true, silent = true})


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