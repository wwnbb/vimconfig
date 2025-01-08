require('nvim_comment').setup()

require('mini.surround').setup()

require('mini.pairs').setup()

require("colorizer").setup({
  filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  user_default_options = {
    tailwind = true,
    mode = "background",
  }
})

require("glow").setup({
  border = "rounded",
  style = "dark",
  width = 120,
})
require("tailwind-classes-fold").setup()


require('dark_notify').run({
  schemes = {
    -- you can use a different colorscheme for each
    dark  = "solarized",
    -- even a different `set background=light/dark` setting or lightline theme
    -- if you use lightline, you may want to configure lightline themes,
    -- even if they're the same one, especially if the theme reacts to :set bg
    light = {
      colorscheme = "solarized",
    }
  }
})
