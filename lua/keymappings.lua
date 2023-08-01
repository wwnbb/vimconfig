local tailwind_classes_fold = require('tailwind-classes-fold')
local keyset = vim.keymap.set

-- VIM EXTRA KEYBINDINGS
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


keyset('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })


local function explore()
  -- path = vim.fn.expand("%")
  api.tree.toggle({ find_file = true, focus = true, path = "<arg>" })
end
keyset('n', '<space>n', explore, { noremap = true, silent = true })


local function plenary_test_file()
  require('plenary.test_harness').test_directory(vim.fn.expand("%:p"))
end
keyset('n', '<space>tl', plenary_test_file, { noremap = true })


keyset('n', 'zt', function()
  tailwind_classes_fold.toggle_conceal()
end)



-- TELESCOPE
local telescope = require('telescope')
local tele = require('telescope.builtin')
local tmake = telescope.extensions.make
local cursor_theme = require('telescope.themes').get_cursor({})
local ivy_theme = require('telescope.themes').get_ivy({})
local github = telescope.extensions.gh

keyset('n', '<space>f', tele.find_files, {})
keyset('v', '<space>S', tele.grep_string, {})
keyset('n', '<space>S', tele.live_grep, {})
keyset('n', '<space>t', tele.resume, {})
keyset('n', '<space>s', tele.lsp_dynamic_workspace_symbols, { noremap = true, silent = true })
keyset('n', '<space>b', tele.buffers, {})
keyset('n', '<space>gb', tele.git_branches, {})
keyset('n', '<space>gc', function()
  require('telescope.builtin').git_commits({
    git_command = { "git", "log", "--oneline", "--pretty=format:'%h - %an - %s - %ad'",
      "--date=format:'%Y-%m-%d %H:%M:%S", "diff" }
  })
end, { noremap = true, silent = true })
keyset('n', '<space>h', tele.help_tags, {})

keyset('n', 'gd', ':Telescope lsp_definitions theme=ivy<CR>', { noremap = true, silent = true })

keyset('n', 'gr', ':Telescope lsp_references theme=ivy<CR>', { noremap = true, silent = true })

keyset('n', 'gi', ':Telescope lsp_implementations theme=ivy<CR>', { noremap = true, silent = true })

keyset('n', '<space>m', ':Telescope make theme=ivy<CR>', {})

local function github_menu()
  github.run({})
end

keyset('n', '<space>tg', github_menu, {})


-- LSP
keyset('n', '<space>r', vim.lsp.buf.rename, {})
