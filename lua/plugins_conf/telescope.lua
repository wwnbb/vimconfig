local telescope = require('telescope')
require('telescope-makefile').setup {
  -- The path where to search the makefile in the priority order
  makefile_priority = { '.', 'build/' },
  default_target = '[DEFAULT]', -- nil or string : Name of the default target | nil will disable the default_target
  make_bin = "make",            -- Custom makefile binary path, uses system make by def
}

telescope.setup {
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
      cmd = { "git", "branch", "--format", "%(refname:lstrip=2)" },
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
