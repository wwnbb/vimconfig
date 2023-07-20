require('git-conflict').setup(
  {
    default_commands = true,     -- disable commands created by this plugin
    disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
    highlights = {               -- They must have background color, otherwise the default color will be used
      incoming = 'DiffText',
      current = 'DiffAdd',
    },
    default_mappings = {
      ours = '<leader>a',
      theirs = '<leader>e',
      none = '<leader>c',
      both = '<leader>o',
      next = '<leader>n',
      prev = '<leader>p',
    },
  }
)
