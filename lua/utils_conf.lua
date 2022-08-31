
require('nvim_comment').setup()

require('mini.surround').setup()

require("telescope").setup({
  extensions = {
    coc = {
        theme = 'ivy',
        prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    }
  },
})
require('telescope').load_extension('coc')
-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').load_extension('fzf')
