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
      git_command = "git branch",
    }
  },
  pickers = {
    lsp_references = {
      theme = "ivy",
    },
    lsp_definitions = {
      theme = "ivy",
    },
    git_branches = {
      cmd = {"git", "branch", "--format", "%(refname:lstrip=2)"},
    }
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

local tele = require('telescope.builtin')
keyset('n', '<space>f', tele.find_files, {})
keyset('v', '<space>S', tele.grep_string, {})
keyset('n', '<space>s', tele.live_grep, {})
keyset('n', '<space>b', tele.buffers, {})
keyset('n', '<space>gb', tele.git_branches, {})
keyset('n', '<space>gc', tele.git_commits, {})
keyset('n', '<space>h', tele.help_tags, {})
keyset('n', 'gd', tele.lsp_definitions, { noremap = true, silent = true })
keyset('n', 'gr', tele.lsp_references, { noremap = true, silent = true })

keyset('n', '<space>m', ':Telescope make<CR>', {})

local make = telescope.extensions.make
local cursor_theme = require('telescope.themes').get_cursor({})
local ivy_theme = require('telescope.themes').get_ivy({})
local github = telescope.extensions.gh

local function github_menu()
  github.run({})
end

keyset('n', '<space>tg', github_menu, {})
