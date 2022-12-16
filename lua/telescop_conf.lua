local keyset = vim.keymap.set

require('telescope').setup{
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
  extensions = {
    coc = {
        prefer_locations = true,
    }
  }
}
require('telescope').load_extension('coc')
require('telescope').load_extension('dap')
require('telescope').load_extension('gh')

local tele = require('telescope.builtin')
keyset('n', '<space>f', tele.find_files, {})
keyset('n', '<space>s', tele.grep_string, {})
keyset('n', '<space>S', tele.live_grep, {})
keyset('n', '<space>b', tele.buffers, {})
keyset('n', '<space>gb', tele.git_branches, {})
keyset('n', '<space>gc', tele.git_commits, {})
keyset('n', '<space>h', tele.help_tags, {})


local coc = require('telescope').extensions.coc
local cursor_theme = require('telescope.themes').get_cursor({})
local ivy_theme = require('telescope.themes').get_ivy({})
local github = require('telescope').extensions.gh

local function dap_conf()
  require('telescope').extensions.dap.configurations(cursor_theme)
end

-- local coc_definition_opts = vim.deepcopy(cursor_theme)
-- coc_definition_opts.on_complete = {
--   function(picker)
--     local index = 0
--     -- get an iterator of entries
--     for _ in picker.manager:iter() do
--       index = index + 1
--       if index > 1 then
--         break
--       end
--     end
--     if index == 1 then
--       require("telescope.actions").select_default(picker.prompt_bufnr)
--     end
--   end,
-- }

local function coc_definition()
  coc.definitions(ivy_theme)
end

local function coc_command()
  coc.coc({})
end

local function coc_references()
  coc.references(ivy_theme)
end

local function github_menu()
  github.run({})
end

keyset('n', '<space>td', dap_conf, {})
keyset('n', '<space>tc', coc_command, {})
keyset('n', '<space>tg', github_menu, {})
keyset('n', 'gr', coc_references, {})
keyset('n', 'gd', coc_definition, {})
