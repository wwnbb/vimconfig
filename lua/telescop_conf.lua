local keyset = vim.keymap.set

local telescope = require('telescope')
require('telescope-makefile').setup{
  -- The path where to search the makefile in the priority order
  makefile_priority = { '.', 'build/' },
  default_target = '[DEFAULT]', -- nil or string : Name of the default target | nil will disable the default_target
  make_bin = "make", -- Custom makefile binary path, uses system make by def
}

telescope.setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key"
      }
    },
    git_branches = {
      git_command = "git branch --no-merged",
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {}
}
telescope.load_extension('make')
telescope.load_extension('dap')
telescope.load_extension('gh')

local tele = require('telescope.builtin')
keyset('n', '<space>f', tele.find_files, {})
keyset('n', '<space>S', tele.grep_string, {})
keyset('v', '<space>S', tele.grep_string, {})
keyset('n', '<space>s', tele.live_grep, {})
keyset('n', '<space>b', tele.buffers, {})
keyset('n', '<space>gb', tele.git_branches, {})
keyset('n', '<space>gc', tele.git_commits, {})
keyset('n', '<space>h', tele.help_tags, {})

keyset('n', '<space>m', ':Telescope make<CR>', {})

local make = telescope.extensions.make
local cursor_theme = require('telescope.themes').get_cursor({})
local ivy_theme = require('telescope.themes').get_ivy({})
local github = telescope.extensions.gh

local function dap_conf()
  require('telescope').extensions.dap.configurations(cursor_theme)
end

local function dap_conf()
  make.configurations(cursor_theme)
end

-- Выбираем первое совпадение в списке


local function github_menu()
  github.run({})
end

-- local function lsp_definitions()
--   require('telescope.builtin').lsp_definitions(ivy_theme)
-- end


local function lsp_references()
  require("telescope.builtin").lsp_references(ivy_theme)
end

local function go_to_mark()
  telescope.extensions.vim_bookmarks.all()
end

keyset('n', '<space>td', dap_conf, {})
keyset('n', '<space>tg', github_menu, {})

-- keyset('n', 'gd', lsp_definitions, { noremap = true, silent = true })
keyset('n', 'gr', lsp_references, { noremap = true, silent = true })
keyset('n', 'gm', go_to_mark, {})
