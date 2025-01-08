-- Eviline config for lualine with Solarized themes
local lualine = require('lualine')

-- Function to get current color scheme based on background setting
local function get_colors()
  local is_dark = vim.go.background == 'dark'
  -- Solarized color palette
  local colors_base = {
    base03  = '#002b36',
    base02  = '#073642',
    base01  = '#586e75',
    base00  = '#657b83',
    base0   = '#839496',
    base1   = '#93a1a1',
    base2   = '#eee8d5',
    base3   = '#fdf6e3',
    yellow  = '#b58900',
    orange  = '#cb4b16',
    red     = '#dc322f',
    magenta = '#d33682',
    violet  = '#6c71c4',
    blue    = '#268bd2',
    cyan    = '#2aa198',
    green   = '#859900'
  }

  -- Color assignments for dark theme
  local colors_dark = {
    text           = colors_base.base1,  -- background areas
    text_highlight = colors_base.base2,  -- highlighted/selected text
    background     = colors_base.base02, -- emphasized content
    yellow         = colors_base.yellow,
    orange         = colors_base.orange,
    red            = colors_base.red,
    magenta        = colors_base.magenta,
    violet         = colors_base.violet,
    blue           = colors_base.blue,
    cyan           = colors_base.cyan,
    green          = colors_base.green
  }

  -- Color assignments for light theme
  local colors_light = {
    text           = colors_base.base01,
    text_highlight = colors_base.base02,
    background     = colors_base.base2,
    yellow         = colors_base.yellow,
    orange         = colors_base.orange,
    red            = colors_base.red,
    magenta        = colors_base.magenta,
    violet         = colors_base.violet,
    blue           = colors_base.blue,
    cyan           = colors_base.cyan,
    green          = colors_base.green
  }

  return is_dark and colors_dark or colors_light
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Create config with dynamic colors
local function create_config()
  local colors = get_colors()

  local config = {
    options = {
      component_separators = '',
      section_separators = { left = '', right = '' },
      theme = {
        normal = {
          a = { fg = colors.fg, bg = colors.cyan, gui = 'bold' },
          b = { fg = colors.background, bg = colors.text },
          c = { fg = colors.background, bg = colors.text }
        },
        inactive = {
          a = { fg = colors.fg, bg = colors.text },
          b = { fg = colors.background, bg = colors.text },
          c = { fg = colors.background, bg = colors.text }
        },
      },
    },
    sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_y = {},
      lualine_z = {},
      lualine_c = {},
      lualine_x = {},
    },
  }

  -- Inserts a component in lualine_c at left section
  local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
  end

  -- Inserts a component in lualine_x at right section
  local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
  end

  ins_left {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 0, right = 1 },
  }

  ins_left {
    -- mode component
    function()
      local mode_map = {
        n = 'NORMAL',
        i = 'INSERT',
        v = 'VISUAL',
        [''] = 'V-BLOCK',
        V = 'V-LINE',
        c = 'COMMAND',
        no = 'NORMAL',
        s = 'SELECT',
        S = 'S-LINE',
        [''] = 'S-BLOCK',
        ic = 'INSERT',
        R = 'REPLACE',
        Rv = 'V-REPLACE',
        cv = 'VIM EX',
        ce = 'EX',
        r = 'PROMPT',
        rm = 'MORE',
        ['r?'] = 'CONFIRM',
        ['!'] = 'SHELL',
        t = 'TERMINAL'
      }
      return mode_map[vim.fn.mode()]
    end,
    color = function()
      mode_color = {
        n      = colors.blue,    -- Normal
        i      = colors.green,   -- Insert
        v      = colors.magenta, -- Visual
        ['']   = colors.magenta, -- Visual Block
        V      = colors.magenta, -- Visual Line
        c      = colors.violet,  -- Command
        no     = colors.blue,    -- Normal
        s      = colors.orange,  -- Select
        S      = colors.orange,  -- Select Line
        ['']   = colors.orange,  -- Select Block
        ic     = colors.yellow,  -- Insert completion
        R      = colors.red,     -- Replace
        Rv     = colors.red,     -- Virtual Replace
        cv     = colors.red,     -- Ex mode
        ce     = colors.red,     -- Normal Ex
        r      = colors.cyan,    -- Prompt
        rm     = colors.cyan,    -- More
        ['r?'] = colors.cyan,    -- Confirm
        ['!']  = colors.blue,    -- Shell
        t      = colors.blue     -- Terminal
      }
      return { fg = mode_color[vim.fn.mode()], bg = colors.text_highlight }
    end,
    padding = { right = 1 },
  }

  ins_left {
    'filesize',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.background, bg = colors.text }
  }

  ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.background, bg = colors.text, gui = 'bold' },
  }

  ins_left {
    'location',
    color = { fg = colors.background, bg = colors.text }
  }

  ins_left {
    'progress',
    color = { fg = colors.background, bg = colors.text, gui = 'bold' }
  }

  ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
      error = { fg = colors.red },
      warn = { fg = colors.yellow },
      info = { fg = colors.cyan },
    },
    color = { bg = colors.text }
  }

  ins_left {
    function()
      return '%='
    end,
  }

  ins_left {
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
      local clients = vim.lsp.get_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return client.name
        end
      end
      return msg
    end,
    icon = ' LSP:',
    color = { fg = colors.background, bg = colors.text, gui = 'bold' },
  }

  ins_right {
    'o:encoding',
    fmt = string.upper,
    cond = conditions.hide_in_width,
    color = { fg = colors.background, bg = colors.text, gui = 'bold' },
  }

  ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false,
    color = { fg = colors.background, bg = colors.text, gui = 'bold' },
  }

  ins_right {
    'branch',
    icon = '',
    color = { fg = colors.background, bg = colors.text, gui = 'bold' },
  }

  ins_right {
    'diff',
    symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
    diff_color = {
      added = { fg = colors.green },
      modified = { fg = colors.orange },
      removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
    color = { bg = colors.text }
  }

  ins_right {
    function()
      return '▊'
    end,
    color = { fg = colors.blue },
    padding = { left = 1 },
  }

  return config
end

-- Setup lualine with auto-updating colors
vim.api.nvim_create_autocmd("OptionSet", {
  pattern = "background",
  callback = function()
    lualine.setup(create_config())
  end,
})

-- Initial setup
lualine.setup(create_config())
