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
